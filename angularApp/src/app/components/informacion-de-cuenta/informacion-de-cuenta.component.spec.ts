import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InformacionDeCuentaComponent } from './informacion-de-cuenta.component';

describe('InformacionDeCuentaComponent', () => {
  let component: InformacionDeCuentaComponent;
  let fixture: ComponentFixture<InformacionDeCuentaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InformacionDeCuentaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InformacionDeCuentaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
