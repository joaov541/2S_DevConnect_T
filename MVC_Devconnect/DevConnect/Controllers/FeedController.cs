using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using DevConnect.Contexts;
using DevConnect.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.EntityFrameworkCore;



namespace DevConnect.Controllers
{

    public class FeedController : Controller
    {
        private readonly db_devconnectContext _context;
        private readonly ILogger<FeedController> _logger;

        public FeedController(ILogger<FeedController> logger, db_devconnectContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {

            try
            {
                  //são todas as publicações
             List<TbPublicacao> publicacaos = await _context.TbPublicacao.Include(p => p.IdUsuarioNavigation).ToListAsync();

             //listar as publicações
            return View(publicacaos);

            }
            
            catch (System.Exception)
            {
                
                throw;
            }
          
        }

        [HttpPost]
        public async Task<IActionResult> Index(IFormCollection form)
        {
            // System.Console.WriteLine($"{form["NomeCompleto"]}");
            // System.Console.WriteLine($"{form.Files[0].FileName}");

            TbPublicacao novaPubli = new TbPublicacao
            {
               
                Textos = form["Textos"].ToString(),
                DataPubli = DateOnly.FromDateTime(DateTime.Now)
            };


            if (form.Files.Count > 0)
            {
                var file = form.Files[0];

                var folder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images");

                if (!Directory.Exists(folder))
                {
                    //Se não existir
                    Directory.CreateDirectory(folder);
                }

                var path = Path.Combine(folder, file.FileName);


                using (var stream = new FileStream(path, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }

                novaPubli.ImagensUrl = file.FileName;
            }

            try
            {
                _context.TbPublicacao.Add(novaPubli);

                await _context.SaveChangesAsync();

                ViewBag.UsuarioPublicacao = "Cadastrada";

                return View();
            }
            catch (System.Exception)
            {
                ViewBag.UsuarioPublicacao = "Nao Cadastrada";
                
                return View();
            }


            // //Adiciona um novo usuário na tabela usuário
            // _context.TbPublicacao.Add(novaPubli);

            // //Salva no banco de dados as alterações feitas
            // await _context.SaveChangesAsync();


            // return RedirectToAction("Index", "Feed");



        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View("Error!");
        }
    }
}
