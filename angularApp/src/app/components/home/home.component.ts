import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent implements OnInit {
  public dataDashboard: number;

  constructor() {}

  ngOnInit(): void {
    this.dataDashboard = history.state.data;
    console.log('assssdadsasdasdasdasdadsad');
    console.log(this.dataDashboard);
    let accountIdElement = document.querySelector('.account-id');
    accountIdElement.innerHTML = this.dataDashboard.toString();
  }
}
