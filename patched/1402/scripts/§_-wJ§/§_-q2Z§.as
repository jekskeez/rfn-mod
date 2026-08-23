package §_-wJ§
{
   import §_-S1n§.§_-nX§;
   import §_-X1k§.§_-42H§;
   import §_-X1k§.§_-WS§;
   import buttons.§_-917§;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import tape.§_-QN§;
   
   public class §_-q2Z§ extends §_-QN§
   {
      
      public static const §_-Y1L§:int = 45;
      
      public static const §_-ws§:int = 45;
      
      private var §_-D2I§:int = -1;
      
      private var crossButton:SimpleButton = null;
      
      private var background:DisplayObject = null;
      
      private var icon:DisplayObject = null;
      
      private var §_-oj§:§_-nX§ = null;
      
      public function §_-q2Z§()
      {
         super();
         this.graphics.beginFill(15784633);
         this.graphics.drawRoundRect(0,0,§_-Y1L§,§_-ws§,5,5);
         this.background = new ElementSlotBack();
         this.background.width = §_-Y1L§;
         this.background.height = §_-ws§;
         addChild(this.background);
         addEventListener(MouseEvent.MOUSE_OVER,this.§_-T2H§);
         addEventListener(MouseEvent.MOUSE_OUT,this.§_-k2s§);
         this.clear();
      }
      
      public function get isEmpty() : Boolean
      {
         return this.elementId == -1;
      }
      
      public function get elementId() : int
      {
         return this.§_-D2I§;
      }
      
      public function set elementId(param1:int) : void
      {
         if(this.§_-D2I§ == param1)
         {
            return;
         }
         this.clear();
         this.§_-D2I§ = param1;
         if(this.elementId == -1)
         {
            return;
         }
         var _loc2_:Class = §_-42H§.§_-D1U§(this.elementId);
         this.icon = new _loc2_();
         this.icon.scaleX = this.icon.scaleY = 0.6;
         this.icon.x += int((§_-Y1L§ - this.icon.width) * 0.5);
         this.icon.y += int((§_-ws§ - this.icon.height) * 0.5);
         addChild(this.icon);
         addChild(this.crossButton);
         this.background.visible = true;
         this.§_-oj§ = new §_-nX§(this,§_-42H§.§_-R2h§,this.elementId);
      }
      
      public function remove() : void
      {
         this.clear();
      }
      
      private function §_-T2H§(param1:MouseEvent) : void
      {
         if(this.icon != null && this.contains(this.icon))
         {
            this.crossButton.visible = true;
         }
      }
      
      private function §_-k2s§(param1:MouseEvent) : void
      {
         if(this.icon != null && this.contains(this.icon))
         {
            this.crossButton.visible = false;
         }
      }
      
      private function §_-Z1t§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.§_-K10§);
         §_-WS§.§_-eL§(this.elementId);
      }
      
      private function clear() : void
      {
         if(this.icon != null && this.contains(this.icon))
         {
            removeChild(this.icon);
         }
         if(this.crossButton != null && contains(this.crossButton))
         {
            this.crossButton.removeEventListener(MouseEvent.CLICK,this.§_-Z1t§);
            removeChild(this.crossButton);
         }
         this.crossButton = new §_-917§();
         this.crossButton.scaleX = this.crossButton.scaleY = 0.8;
         this.crossButton.x = 27;
         this.crossButton.y = 4;
         this.crossButton.visible = false;
         this.crossButton.filters = [new GlowFilter(16777215,1,4,4,3)];
         this.crossButton.addEventListener(MouseEvent.CLICK,this.§_-Z1t§);
         addChild(this.crossButton);
         this.background.visible = false;
         this.§_-D2I§ = -1;
         if(this.§_-oj§ == null)
         {
            return;
         }
         this.§_-oj§.remove();
      }
   }
}

