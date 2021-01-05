import { ComponentFixture, TestBed } from '@angular/core/testing';

import { IngresoDineroComponent } from './ingreso-dinero.component';

describe('IngresoDineroComponent', () => {
  let component: IngresoDineroComponent;
  let fixture: ComponentFixture<IngresoDineroComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ IngresoDineroComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(IngresoDineroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
