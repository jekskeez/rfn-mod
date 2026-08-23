package §_-r16§
{
   import §_-I10§.§_-k1C§;
   import §_-I10§.§_-vy§;
   import §_-e1G§.§_-034§;
   import buttons.§_-91k§;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import tape.§_-K2k§;
   
   public class §_-U3§ extends §_-K2k§
   {
      
      public static const §_-rz§:int = 45;
      
      public static const §_-p1h§:int = 45;
      
      private var §_-E1c§:int = -1;
      
      private var crossButton:SimpleButton = null;
      
      private var background:DisplayObject = null;
      
      private var icon:DisplayObject = null;
      
      private var §_-XW§:§_-034§ = null;
      
      public function §_-U3§()
      {
         super();
         this.graphics.beginFill(15784633);
         this.graphics.drawRoundRect(0,0,§_-rz§,§_-p1h§,5,5);
         this.background = new ElementSlotBack();
         this.background.width = §_-rz§;
         this.background.height = §_-p1h§;
         addChild(this.background);
         addEventListener(MouseEvent.MOUSE_OVER,this.§_-Q20§);
         addEventListener(MouseEvent.MOUSE_OUT,this.§_-9c§);
         this.clear();
      }
      
      public function get isEmpty() : Boolean
      {
         return this.elementId == -1;
      }
      
      public function get elementId() : int
      {
         return this.§_-E1c§;
      }
      
      public function set elementId(param1:int) : void
      {
         if(this.§_-E1c§ == param1)
         {
            return;
         }
         this.clear();
         this.§_-E1c§ = param1;
         if(this.elementId == -1)
         {
            return;
         }
         var _loc2_:Class = §_-vy§.§_-z2p§(this.elementId);
         this.icon = new _loc2_();
         this.icon.scaleX = this.icon.scaleY = 0.6;
         this.icon.x += int((§_-rz§ - this.icon.width) * 0.5);
         this.icon.y += int((§_-p1h§ - this.icon.height) * 0.5);
         addChild(this.icon);
         addChild(this.crossButton);
         this.background.visible = true;
         this.§_-XW§ = new §_-034§(this,§_-vy§.§_-13q§,this.elementId);
      }
      
      public function remove() : void
      {
         this.clear();
      }
      
      private function §_-Q20§(param1:MouseEvent) : void
      {
         if(this.icon != null && this.contains(this.icon))
         {
            this.crossButton.visible = true;
         }
      }
      
      private function §_-9c§(param1:MouseEvent) : void
      {
         if(this.icon != null && this.contains(this.icon))
         {
            this.crossButton.visible = false;
         }
      }
      
      private function §_-K2S§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.§_-o1e§);
         §_-k1C§.§_-72N§(this.elementId);
      }
      
      private function clear() : void
      {
         if(this.icon != null && this.contains(this.icon))
         {
            removeChild(this.icon);
         }
         if(this.crossButton != null && contains(this.crossButton))
         {
            this.crossButton.removeEventListener(MouseEvent.CLICK,this.§_-K2S§);
            removeChild(this.crossButton);
         }
         this.crossButton = new §_-91k§();
         this.crossButton.scaleX = this.crossButton.scaleY = 0.8;
         this.crossButton.x = 27;
         this.crossButton.y = 4;
         this.crossButton.visible = false;
         this.crossButton.filters = [new GlowFilter(16777215,1,4,4,3)];
         this.crossButton.addEventListener(MouseEvent.CLICK,this.§_-K2S§);
         addChild(this.crossButton);
         this.background.visible = false;
         this.§_-E1c§ = -1;
         if(this.§_-XW§ == null)
         {
            return;
         }
         this.§_-XW§.remove();
      }
   }
}

