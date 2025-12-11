using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace DevConnect.Models;

[Table("tb_publicacao")]
public partial class TbPublicacao
{
    [Key]
    [Column("id_publicacao")]
    public int IdPublicacao { get; set; }


    [Column("textos")]
    [StringLength(255)]
    public string Textos { get; set; } = null!;

    [Column("imagens_url")]
    [StringLength(255)]
    public string? ImagensUrl { get; set; }

    [Column("data_publi")]
    public DateOnly DataPubli { get; set; }

    [Column("id_usuario")]
    public int? IdUsuario { get; set; }

    [ForeignKey("IdUsuario")]
    [InverseProperty("TbPublicacao")]
    public virtual TbUsuario? IdUsuarioNavigation { get; set; }

    [InverseProperty("IdPublicacaoNavigation")]
    public virtual ICollection<TbComentario> TbComentario { get; set; } = new List<TbComentario>();

    [InverseProperty("IdPublicacaoNavigation")]
    public virtual ICollection<TbCurtida> TbCurtida { get; set; } = new List<TbCurtida>();
    
}
