export class RegistrarUsuario {
  IdUsuario: number; //when using por a post maybe leave whiouth value like null, undefined or asign some value and reasign with whe actual id from the database
  Nombre: string;
  Apellido: string;
  // FotoFrenteDni:File;
  // FotoReversoDni:File;
  FotoFrenteDni: String;
  FotoReversoDni: String;
  Dni: Number;
  Email: String;
  FechaDeNacimiento: Date; //or maybe string
  CuilCuit: bigint; //number is valid type for his equivalent in sql server type of long?
  Telefono: string;
  Calle: string;
  NumeroDeCalle: string;
  Departamento: boolean;
  Piso: number;
  Puerta: string;
  Barrio: string;
  CodigoPostal: string;
  IdLocalidad: number;
  Username: string;
  Password: string;
  preguntaSecreta: string;
  respuestaSecreta: string;
}
