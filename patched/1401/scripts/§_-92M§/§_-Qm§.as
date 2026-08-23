package §_-92M§
{
   import §_-S1D§.§_-O1M§;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import protocol.§_-S2I§;
   
   public class §_-Qm§ extends Sprite
   {
      
      protected var §_-kH§:Sprite = new Sprite();
      
      protected var buttons:Vector.<§_-X2z§> = new Vector.<§_-X2z§>();
      
      public function §_-Qm§()
      {
         super();
         addChild(this.§_-kH§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§);
      }
      
      override public function set visible(param1:Boolean) : void
      {
         if(super.visible == param1)
         {
            return;
         }
         super.visible = param1;
         this.§_-q2S§();
      }
      
      public function addButton(param1:§_-X2z§) : void
      {
         this.buttons.push(param1);
         this.§_-kH§.addChild(param1);
      }
      
      public function get §_-Ut§() : Boolean
      {
         return this.buttons.length > 0;
      }
      
      public function get perksAvailable() : Boolean
      {
         return !§_-q1p§.§_-Vz§.nonPerk && §_-O1M§.§_-F2g§ == §_-S2I§.ROUND_START && !(§_-O1M§.hero && §_-O1M§.hero.isHare);
      }
      
      public function get perksVisible() : Boolean
      {
         return this.§_-Ut§;
      }
      
      public function updateButtons() : void
      {
         var _loc1_:§_-X2z§ = null;
         for each(_loc1_ in this.buttons)
         {
            _loc1_.§_-Dh§();
         }
      }
      
      protected function get hotKeys() : Array
      {
         return [Keyboard.NUMBER_1,Keyboard.NUMBER_2,Keyboard.NUMBER_3,Keyboard.NUMBER_4,Keyboard.NUMBER_5,Keyboard.NUMBER_6,Keyboard.NUMBER_7,Keyboard.NUMBER_8,Keyboard.NUMBER_9,Keyboard.NUMBER_0];
      }
      
      protected function get needVisible() : Boolean
      {
         return true;
      }
      
      protected function §_-q2S§() : void
      {
         var _loc1_:int = Math.min(this.buttons.length,this.hotKeys.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            if((this.visible || !this.needVisible) && this.hotKeys[_loc2_] != null)
            {
               this.buttons[_loc2_].§_-ci§(String.fromCharCode(this.hotKeys[_loc2_]));
            }
            else
            {
               this.buttons[_loc2_].§_-Yf§();
            }
            _loc2_++;
         }
      }
      
      protected function get keyCode() : uint
      {
         return 0;
      }
      
      protected function §_-21G§(param1:KeyboardEvent) : void
      {
         if(param1.shiftKey || param1.ctrlKey)
         {
            return;
         }
         if(!this.perksAvailable || !this.perksVisible)
         {
            return;
         }
         if(Boolean(Game.chat) && Game.chat.visible)
         {
            return;
         }
         if(param1.keyCode == this.keyCode)
         {
            this.visible = !this.visible;
            return;
         }
         if(this.needVisible && !this.visible)
         {
            return;
         }
         var _loc2_:int = Math.min(this.buttons.length,this.hotKeys.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(param1.keyCode == this.hotKeys[_loc3_])
            {
               this.buttons[_loc3_].§_-P2v§();
               param1.stopImmediatePropagation();
               return;
            }
            _loc3_++;
         }
      }
   }
}

