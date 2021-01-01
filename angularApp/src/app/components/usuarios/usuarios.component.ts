import { Component, OnInit } from '@angular/core';
import {UsuarioService} from '../../services/usuario.service';
import {Usuario} from '../../models/usuario.model';


@Component({
  selector: 'app-usuarios',
  templateUrl: './usuarios.component.html',
  styleUrls: ['./usuarios.component.scss']
})
export class UsuariosComponent implements OnInit {

  public usuarios: Usuario[];
  constructor(private usuarioService:UsuarioService) { }

  

  ngOnInit(): void {

    
    this.usuarioService.getUsuarios().subscribe(res=>{
      console.log(res);
      this.usuarios=res;
    })
    
    this.usuarioService.getUsuarioById().subscribe(res=>{
      console.log(res);
    })
  }
  UsuarioAlert(){
    alert("Alerta de metodo usuario!");
  }
}
