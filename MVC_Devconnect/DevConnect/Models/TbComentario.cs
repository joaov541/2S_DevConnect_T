using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace DevConnect.Models;

[Table("tb_comentario")]
[Index("NomeUsuario", Name = "UQ__tb_comen__CCB80B0A0FDD2A81", IsUnique = true)]
public partial class TbComentario
{
    [Key]
    [Column("id_comentario")]
    public int IdComentario { get; set; }

    [Column("nome_usuario")]
    [StringLength(255)]
    public string NomeUsuario { get; set; } = null!;

    [Column("textos_coment")]
    [StringLength(255)]
    public string TextosComent { get; set; } = null!;

    [Column("horario_coment")]
    public TimeOnly HorarioComent { get; set; }

    [Column("imagem_coment")]
    [StringLength(255)]
    public string ImagemComent { get; set; } = null!;

    [Column("id_publicacao")]
    public int? IdPublicacao { get; set; }

    [ForeignKey("IdPublicacao")]
    [InverseProperty("TbComentario")]
    public virtual TbPublicacao? IdPublicacaoNavigation { get; set; }
}
