package utils
{
   import flash.display.Graphics;
   import flash.display.Sprite;
   
   public class §_-45§ extends Sprite
   {
      
      private var §_-L28§:Sprite = new Sprite();
      
      private var §_-L1§:Number = 0;
      
      private var §_-Z5§:Number = 0;
      
      private var §_-T0§:int = 0;
      
      private var §_-e2v§:Number = 10;
      
      public function §_-45§()
      {
         super();
         this.mask = this.§_-L28§;
         addChild(this.mask);
      }
      
      public function draw() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(this.color,1);
         this.graphics.drawCircle(0,0,this.radius);
         this.§_-L28§.graphics.clear();
         this.§_-L28§.graphics.beginFill(0,1);
         this.§_-L28§.graphics.moveTo(0,0);
         this.§_-B1E§(this.§_-L28§.graphics,this.start);
         this.§_-B1E§(this.§_-L28§.graphics,(this.start + this.end) * 0.25);
         this.§_-B1E§(this.§_-L28§.graphics,(this.start + this.end) * 0.5);
         this.§_-B1E§(this.§_-L28§.graphics,(this.start + this.end) * 0.75);
         this.§_-B1E§(this.§_-L28§.graphics,this.end);
         this.§_-L28§.graphics.lineTo(0,0);
      }
      
      public function §_-B1E§(param1:Graphics, param2:Number) : void
      {
         param1.lineTo(Math.sin(param2) * this.radius * 2,Math.cos(param2) * this.radius * 2);
      }
      
      public function get start() : Number
      {
         return this.§_-L1§;
      }
      
      public function set start(param1:Number) : void
      {
         this.§_-L1§ = param1;
         this.draw();
      }
      
      public function get end() : Number
      {
         return this.§_-Z5§;
      }
      
      public function set end(param1:Number) : void
      {
         this.§_-Z5§ = param1;
         this.draw();
      }
      
      public function get color() : int
      {
         return this.§_-T0§;
      }
      
      public function set color(param1:int) : void
      {
         this.§_-T0§ = param1;
         this.draw();
      }
      
      public function get radius() : Number
      {
         return this.§_-e2v§;
      }
      
      public function set radius(param1:Number) : void
      {
         this.§_-e2v§ = param1;
         this.draw();
      }
   }
}

