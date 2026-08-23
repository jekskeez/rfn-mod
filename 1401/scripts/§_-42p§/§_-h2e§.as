package §_-42p§
{
   import §_-RI§.§_-h2I§;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import game.mainGame.entity.§_-B2Q§;
   
   public class §_-h2e§ extends §_-h2I§ implements §_-B2Q§
   {
      
      private var §_-6p§:Number;
      
      private var §_-02k§:Number;
      
      private var §_-if§:Boolean;
      
      public function §_-h2e§(param1:Number = 0, param2:Number = 0)
      {
         super();
         this.level = param1;
         this.velocity = param2;
         addEventListener(MouseEvent.MOUSE_DOWN,this.§_-53X§);
      }
      
      public function copy() : §_-h2e§
      {
         return new §_-h2e§(this.level,this.velocity);
      }
      
      public function update(param1:Number) : void
      {
         this.level = -Math.abs(this.level);
         if(this.§_-if§)
         {
            return;
         }
         this.level += this.velocity * param1;
      }
      
      public function get level() : Number
      {
         return this.§_-6p§;
      }
      
      public function set level(param1:Number) : void
      {
         this.§_-6p§ = param1;
         this.y = param1;
      }
      
      public function get velocity() : Number
      {
         return this.§_-02k§;
      }
      
      public function set velocity(param1:Number) : void
      {
         this.§_-02k§ = param1;
      }
      
      private function §_-820§(param1:Event) : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-D23§);
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-820§);
         this.§_-if§ = false;
         this.velocity = 0;
      }
      
      private function §_-53X§(param1:Event) : void
      {
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.§_-820§);
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-D23§);
         this.§_-if§ = true;
      }
      
      private function §_-D23§(param1:MouseEvent) : void
      {
         var _loc2_:Point = this.parent.globalToLocal(new Point(param1.stageX,param1.stageY));
         this.level = _loc2_.y;
      }
   }
}

