using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace DevConnect.Models;

[Index("Email", Name = "UQ__Usuario__AB6E6164FF7483FF", IsUnique = true)]
[Index("NomeUsuario", Name = "UQ__Usuario__CCB80B0ABC3A925B", IsUnique = true)]
[Index("NumeroSenha", Name = "UQ__Usuario__DFC72C5F08F8D94F", IsUnique = true)]
public partial class Usuario
{
    [Key]
    [Column("id_usuario")]
    public int IdUsuario { get; set; }

    [Column("nome_completo")]
    [StringLength(255)]
    public string NomeCompleto { get; set; } = null!;

    [Column("nome_usuario")]
    [StringLength(50)]
    public string NomeUsuario { get; set; } = null!;

    [Column("email")]
    [StringLength(255)]
    public string Email { get; set; } = null!;

    [Column("numero_senha")]
    [StringLength(50)]
    public string NumeroSenha { get; set; } = null!;

    [Column("foto_perfil")]
    [StringLength(255)]
    public string FotoPerfil { get; set; } = null!;
}
