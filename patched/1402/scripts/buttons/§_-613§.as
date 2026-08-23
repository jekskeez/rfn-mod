package buttons
{
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   
   public class §_-613§ extends Sprite
   {
      
      protected var active:DisplayObject;
      
      protected var §_-3E§:DisplayObject;
      
      public var state:Boolean;
      
      public function §_-613§(param1:DisplayObject, param2:DisplayObject, param3:Boolean = false)
      {
         super();
         this.active = param1;
         this.§_-3E§ = param2;
         addChild(this.active);
         addChild(this.§_-3E§);
         this.active.addEventListener(MouseEvent.CLICK,this.§_-03S§);
         this.§_-3E§.addEventListener(MouseEvent.CLICK,this.§_-03S§);
         if(!param3)
         {
            if(this.§_-3E§ is InteractiveObject)
            {
               (this.§_-3E§ as InteractiveObject).mouseEnabled = false;
            }
            if(this.§_-3E§ is SimpleButton)
            {
               (this.§_-3E§ as SimpleButton).useHandCursor = false;
            }
         }
      }
      
      private function §_-03S§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.§_-K10§);
      }
      
      public function setState(param1:Boolean) : void
      {
         this.state = param1;
         this.active.visible = param1;
         this.§_-3E§.visible = !param1;
      }
   }
}

