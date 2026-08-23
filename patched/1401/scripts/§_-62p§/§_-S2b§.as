package §_-62p§
{
   import §_-P2b§.§_-6L§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-S2b§ extends Sprite
   {
      
      private var §_-4A§:int = -1;
      
      private var §_-zl§:§_-22V§ = null;
      
      private var §_-n2P§:§_-22V§ = null;
      
      private var image:DisplayObject = null;
      
      public function §_-S2b§(param1:int = -1)
      {
         super();
         this.§_-zl§ = new §_-22V§("",25,0,new TextFormat(null,12,6829595,true));
         addChild(this.§_-zl§);
         this.§_-n2P§ = new §_-22V§("",25,15,new TextFormat(null,12,6829595),365);
         addChild(this.§_-n2P§);
         this.id = param1;
      }
      
      public function set id(param1:int) : void
      {
         if(this.id == param1)
         {
            return;
         }
         this.§_-4A§ = param1;
         if(this.image)
         {
            removeChild(this.image);
         }
         this.image = §_-6L§.§_-Gi§(this.id);
         this.image.y = 20;
         addChild(this.image);
         this.§_-zl§.text = §_-6L§.getName(this.id);
         this.§_-n2P§.text = §_-6L§.§_-l7§(this.id);
      }
      
      public function get id() : int
      {
         return this.§_-4A§;
      }
   }
}

