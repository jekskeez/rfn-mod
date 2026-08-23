package buttons
{
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import utils.§_-x1Z§;
   
   public class §_-Uo§ extends Sprite
   {
      
      private var §_-PT§:Boolean = true;
      
      private var sprite:Sprite = null;
      
      private var button:SimpleButton = null;
      
      public function §_-Uo§(param1:SimpleButton)
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
         return this.§_-PT§;
      }
      
      override public function set mouseEnabled(param1:Boolean) : void
      {
         if(this.§_-PT§ == param1)
         {
            return;
         }
         this.§_-PT§ = param1;
         this.button.enabled = param1;
         this.button.mouseEnabled = super.mouseEnabled = param1;
         this.mouseChildren = param1;
         this.filters = param1 ? [] : §_-x1Z§.§_-c2G§;
      }
   }
}

