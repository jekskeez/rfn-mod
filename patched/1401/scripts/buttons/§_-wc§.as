package buttons
{
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   
   public class §_-wc§ extends Sprite
   {
      
      protected var active:DisplayObject;
      
      protected var §_-q2l§:DisplayObject;
      
      public var state:Boolean;
      
      public function §_-wc§(param1:DisplayObject, param2:DisplayObject, param3:Boolean = false)
      {
         super();
         this.active = param1;
         this.§_-q2l§ = param2;
         addChild(this.active);
         addChild(this.§_-q2l§);
         this.active.addEventListener(MouseEvent.CLICK,this.§_-3N§);
         this.§_-q2l§.addEventListener(MouseEvent.CLICK,this.§_-3N§);
         if(!param3)
         {
            if(this.§_-q2l§ is InteractiveObject)
            {
               (this.§_-q2l§ as InteractiveObject).mouseEnabled = false;
            }
            if(this.§_-q2l§ is SimpleButton)
            {
               (this.§_-q2l§ as SimpleButton).useHandCursor = false;
            }
         }
      }
      
      private function §_-3N§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.§_-o1e§);
      }
      
      public function setState(param1:Boolean) : void
      {
         this.state = param1;
         this.active.visible = param1;
         this.§_-q2l§.visible = !param1;
      }
   }
}

