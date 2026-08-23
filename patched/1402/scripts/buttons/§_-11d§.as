package buttons
{
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import utils.§_-y1l§;
   
   public class §_-11d§ extends Sprite
   {
      
      private var §_-aJ§:Boolean = true;
      
      private var sprite:Sprite = null;
      
      private var button:SimpleButton = null;
      
      public function §_-11d§(param1:SimpleButton)
      {
         super();
         this.button = param1;
         this.button.upState.cacheAsBitmap = true;
         this.sprite = new Sprite();
         addChild(this.sprite);
         this.sprite.addChild(this.button);
      }
      
      override public function get mouseEnabled() : Boolean
      {
         return this.§_-aJ§;
      }
      
      override public function set mouseEnabled(param1:Boolean) : void
      {
         if(this.§_-aJ§ == param1)
         {
            return;
         }
         this.§_-aJ§ = param1;
         this.button.enabled = param1;
         this.button.mouseEnabled = super.mouseEnabled = param1;
         this.mouseChildren = param1;
         this.filters = param1 ? [] : §_-y1l§.§_-Tk§;
      }
   }
}

