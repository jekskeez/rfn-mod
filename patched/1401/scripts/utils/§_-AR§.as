package utils
{
   import flash.display.Graphics;
   import flash.display.Sprite;
   
   public class §_-AR§ extends Sprite
   {
      
      private var §_-V1r§:Sprite = new Sprite();
      
      private var §_-q2a§:Number = 0;
      
      private var §_-93u§:Number = 0;
      
      private var §_-83K§:int = 0;
      
      private var §_-J1D§:Number = 10;
      
      public function §_-AR§()
      {
         super();
         this.mask = this.§_-V1r§;
         addChild(this.mask);
      }
      
      public function draw() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(this.color,1);
         this.graphics.drawCircle(0,0,this.radius);
         this.§_-V1r§.graphics.clear();
         this.§_-V1r§.graphics.beginFill(0,1);
         this.§_-V1r§.graphics.moveTo(0,0);
         this.§_-lA§(this.§_-V1r§.graphics,this.start);
         this.§_-lA§(this.§_-V1r§.graphics,(this.start + this.end) * 0.25);
         this.§_-lA§(this.§_-V1r§.graphics,(this.start + this.end) * 0.5);
         this.§_-lA§(this.§_-V1r§.graphics,(this.start + this.end) * 0.75);
         this.§_-lA§(this.§_-V1r§.graphics,this.end);
         this.§_-V1r§.graphics.lineTo(0,0);
      }
      
      public function §_-lA§(param1:Graphics, param2:Number) : void
      {
         param1.lineTo(Math.sin(param2) * this.radius * 2,Math.cos(param2) * this.radius * 2);
      }
      
      public function get start() : Number
      {
         return this.§_-q2a§;
      }
      
      public function set start(param1:Number) : void
      {
         this.§_-q2a§ = param1;
         this.draw();
      }
      
      public function get end() : Number
      {
         return this.§_-93u§;
      }
      
      public function set end(param1:Number) : void
      {
         this.§_-93u§ = param1;
         this.draw();
      }
      
      public function get color() : int
      {
         return this.§_-83K§;
      }
      
      public function set color(param1:int) : void
      {
         this.§_-83K§ = param1;
         this.draw();
      }
      
      public function get radius() : Number
      {
         return this.§_-J1D§;
      }
      
      public function set radius(param1:Number) : void
      {
         this.§_-J1D§ = param1;
         this.draw();
      }
   }
}

