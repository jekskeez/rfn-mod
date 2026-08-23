package tape
{
   import §_-8Q§.§_-92B§;
   import §_-8Q§.§_-ys§;
   import §_-ZL§.§_-lm§;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import utils.§_-v2E§;
   
   public class §_-nc§ extends §_-O2a§
   {
      
      private var on:ShamaningOn = new ShamaningOn();
      
      private var off:ShamaningOff = new ShamaningOff();
      
      private var §_-D2k§:Boolean = false;
      
      public var §_-J28§:Boolean = false;
      
      public function §_-nc§(param1:Class)
      {
         super(param1,TapeShamaingButton);
         this.button.addEventListener(MouseEvent.CLICK,this.§_-p1p§);
         this.on.x = 39;
         this.on.y = 29;
         this.on.mouseEnabled = false;
         addChild(this.on);
         this.§_-J28§ = §_-v2E§.§_-H23§(this.className,"ISaveInvert");
         this.off.x = 39;
         this.off.y = 29;
         this.off.mouseEnabled = false;
         addChild(this.off);
         this.state = this.§_-J28§;
      }
      
      public function get state() : Boolean
      {
         return this.§_-D2k§;
      }
      
      public function set state(param1:Boolean) : void
      {
         this.§_-D2k§ = param1;
         param1 = this.§_-J28§ ? !param1 : param1;
         this.on.visible = param1;
         this.off.visible = !param1;
      }
      
      private function §_-p1p§(param1:Event) : void
      {
         if((className == §_-92B§ || className == §_-ys§) && §_-lm§.mode != §_-at§.§_-F15§)
         {
            this.state = false;
            return;
         }
         this.state = !this.state;
      }
   }
}

