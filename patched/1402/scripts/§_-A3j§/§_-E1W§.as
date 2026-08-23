package §_-A3j§
{
   import §_-TK§.§_-aS§;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import game.mainGame.entity.§_-p0§;
   
   public class §_-E1W§ extends §_-aS§ implements §_-p0§
   {
      
      private var §_-Xl§:Number;
      
      private var §_-J1H§:Number;
      
      private var §_-11W§:Boolean;
      
      public function §_-E1W§(param1:Number = 0, param2:Number = 0)
      {
         super();
         this.level = param1;
         this.velocity = param2;
         addEventListener(MouseEvent.MOUSE_DOWN,this.§_-H2§);
      }
      
      public function copy() : §_-E1W§
      {
         return new §_-E1W§(this.level,this.velocity);
      }
      
      public function update(param1:Number) : void
      {
         this.level = -Math.abs(this.level);
         if(this.§_-11W§)
         {
            return;
         }
         this.level += this.velocity * param1;
      }
      
      public function get level() : Number
      {
         return this.§_-Xl§;
      }
      
      public function set level(param1:Number) : void
      {
         this.§_-Xl§ = param1;
         this.y = param1;
      }
      
      public function get velocity() : Number
      {
         return this.§_-J1H§;
      }
      
      public function set velocity(param1:Number) : void
      {
         this.§_-J1H§ = param1;
      }
      
      private function §_-d2Y§(param1:Event) : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-Cv§);
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-d2Y§);
         this.§_-11W§ = false;
         this.velocity = 0;
      }
      
      private function §_-H2§(param1:Event) : void
      {
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.§_-d2Y§);
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-Cv§);
         this.§_-11W§ = true;
      }
      
      private function §_-Cv§(param1:MouseEvent) : void
      {
         var _loc2_:Point = this.parent.globalToLocal(new Point(param1.stageX,param1.stageY));
         this.level = _loc2_.y;
      }
   }
}

