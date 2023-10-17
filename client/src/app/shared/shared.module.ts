import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MessageModalComponent } from './message-modal/message-modal.component';

@NgModule({
  declarations: [MessageModalComponent],
  imports: [CommonModule],
  exports: [MessageModalComponent],
})
export class SharedModule {}
