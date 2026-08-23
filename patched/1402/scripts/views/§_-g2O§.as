package views
{
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   
   public class §_-g2O§ extends Sprite
   {
      
      private var §_-21f§:§_-i5§ = null;
      
      private var §_-UN§:§_-i5§ = null;
      
      private var §_-23u§:§_-33e§ = null;
      
      public function §_-g2O§()
      {
         super();
         var _loc1_:TextFormat = new TextFormat(§_-i5§.§_-p1s§,16,5190674);
         this.§_-21f§ = new §_-i5§("+100",108,18,_loc1_);
         this.§_-21f§.rotation = -30;
         addChild(this.§_-21f§);
         this.§_-UN§ = new §_-i5§("+100",200,18,_loc1_);
         this.§_-UN§.rotation = -30;
         addChild(this.§_-UN§);
         this.§_-23u§ = new §_-33e§("x1",new TextFormat(§_-i5§.§_-p1s§,20,16754945),[16761125,16724736],[new GlowFilter(5190674,1,3,3,4)]);
         this.§_-23u§.rotation = -30;
         this.§_-23u§.y = 14;
         this.§_-23u§.x = 2;
         addChild(this.§_-23u§);
      }
      
      public function set count(param1:int) : void
      {
         this.visible = param1 > 0;
         if(!this.visible)
         {
            return;
         }
         this.§_-21f§.text = "+" + param1 * 50;
         this.§_-UN§.text = "+" + param1 * 500;
         this.§_-23u§.text = "x" + param1.toString();
      }
   }
}

