package §_-K1§
{
   import §_-j2E§.§_-A11§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-q1m§ extends Sprite
   {
      
      private var §_-n2x§:int = -1;
      
      private var §_-Y1T§:§_-i5§ = null;
      
      private var §_-Z11§:§_-i5§ = null;
      
      private var image:DisplayObject = null;
      
      public function §_-q1m§(param1:int = -1)
      {
         super();
         this.§_-Y1T§ = new §_-i5§("",25,0,new TextFormat(null,12,6829595,true));
         addChild(this.§_-Y1T§);
         this.§_-Z11§ = new §_-i5§("",25,15,new TextFormat(null,12,6829595),365);
         addChild(this.§_-Z11§);
         this.id = param1;
      }
      
      public function set id(param1:int) : void
      {
         if(this.id == param1)
         {
            return;
         }
         this.§_-n2x§ = param1;
         if(this.image)
         {
            removeChild(this.image);
         }
         this.image = §_-A11§.§_-51T§(this.id);
         this.image.y = 20;
         addChild(this.image);
         this.§_-Y1T§.text = §_-A11§.getName(this.id);
         this.§_-Z11§.text = §_-A11§.§_-ya§(this.id);
      }
      
      public function get id() : int
      {
         return this.§_-n2x§;
      }
   }
}

