package views
{
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   
   public class §_-I2Z§ extends Sprite
   {
      
      private var §_-r3§:§_-22V§ = null;
      
      private var §_-zz§:§_-22V§ = null;
      
      private var §_-U1W§:§_-dP§ = null;
      
      public function §_-I2Z§()
      {
         super();
         var _loc1_:TextFormat = new TextFormat(§_-22V§.§_-pJ§,16,5190674);
         this.§_-r3§ = new §_-22V§("+100",108,18,_loc1_);
         this.§_-r3§.rotation = -30;
         addChild(this.§_-r3§);
         this.§_-zz§ = new §_-22V§("+100",200,18,_loc1_);
         this.§_-zz§.rotation = -30;
         addChild(this.§_-zz§);
         this.§_-U1W§ = new §_-dP§("x1",new TextFormat(§_-22V§.§_-pJ§,20,16754945),[16761125,16724736],[new GlowFilter(5190674,1,3,3,4)]);
         this.§_-U1W§.rotation = -30;
         this.§_-U1W§.y = 14;
         this.§_-U1W§.x = 2;
         addChild(this.§_-U1W§);
      }
      
      public function set count(param1:int) : void
      {
         this.visible = param1 > 0;
         if(!this.visible)
         {
            return;
         }
         this.§_-r3§.text = "+" + param1 * 50;
         this.§_-zz§.text = "+" + param1 * 500;
         this.§_-U1W§.text = "x" + param1.toString();
      }
   }
}

