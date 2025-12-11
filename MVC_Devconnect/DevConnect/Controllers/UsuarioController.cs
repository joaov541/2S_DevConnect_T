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
    
    public class UsuarioController : Controller
    {
        private readonly db_devconnectContext _context;
        private readonly ILogger<UsuarioController> _logger;

        public UsuarioController(ILogger<UsuarioController> logger, db_devconnectContext context)
        {
            _logger = logger;
            _context = context;
        }

        //Listar
        [HttpGet]
        public IActionResult Index()
        {
            ViewBag.UsuarioNovoCadastrado = "";
            TempData["UsuarioNovoCadastrado"] = "";
            return View();
        }

        //Cadastrar
         [HttpPost]
        public async Task<IActionResult> Index(IFormCollection form)
        {
            // System.Console.WriteLine($"{form["NomeCompleto"]}");
            // System.Console.WriteLine($"{form.Files[0].FileName}");

            TbUsuario novoUsuario = new TbUsuario
            {
                NomeCompleto = form["NomeCompleto"].ToString(),
                NomeUsuario = form["NomeUsuario"].ToString(),
                Email = form["Email"].ToString(),
                NumeroSenha = form["NumeroSenha"].ToString(),
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


                using(var stream = new FileStream(path, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }

                novoUsuario.FotoPerfil = file.FileName;

            }

            else
            {
                novoUsuario.FotoPerfil = "fotopadrao png";
            }

            try
            {
                //Adiciona um novo usuário na tabela usuário
                _context.TbUsuario.Add(novoUsuario);

                //Salva no banco de dados as alterações feitas
               await _context.SaveChangesAsync();

               TempData["UsuarioNovoCadastrado"] = "Cadastrado";
               ViewBag.UsuarioNovoCadastrado = "";

               return RedirectToAction("Index", "Home");
            }
            catch (System.Exception)
            {
                ViewBag.UsuarioNovoCadastrado = "Nao cadastrado";
                TempData["UsuarioNovoCadastrado"] = "";
            //vamos pedir para a view falar ao usuário que não foi cadastrado    
            return View();
                
            }

        }

        public IActionResult Perfil()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View("Error!");
        }
    }
}