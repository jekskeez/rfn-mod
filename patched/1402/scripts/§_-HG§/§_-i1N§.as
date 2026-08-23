package §_-HG§
{
   import §_-61C§.§_-a2p§;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import protocol.§_-s2l§;
   
   public class §_-i1N§ extends Sprite
   {
      
      protected var §_-E1l§:Sprite = new Sprite();
      
      protected var buttons:Vector.<§_-w2L§> = new Vector.<§_-w2L§>();
      
      public function §_-i1N§()
      {
         super();
         addChild(this.§_-E1l§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§);
      }
      
      override public function set visible(param1:Boolean) : void
      {
         if(super.visible == param1)
         {
            return;
         }
         super.visible = param1;
         this.§_-33H§();
      }
      
      public function addButton(param1:§_-w2L§) : void
      {
         this.buttons.push(param1);
         this.§_-E1l§.addChild(param1);
      }
      
      public function get §_-W1K§() : Boolean
      {
         return this.buttons.length > 0;
      }
      
      public function get perksAvailable() : Boolean
      {
         return !§_-at§.§_-F2u§.nonPerk && §_-a2p§.§_-j2F§ == §_-s2l§.ROUND_START && !(§_-a2p§.hero && §_-a2p§.hero.isHare);
      }
      
      public function get perksVisible() : Boolean
      {
         return this.§_-W1K§;
      }
      
      public function updateButtons() : void
      {
         var _loc1_:§_-w2L§ = null;
         for each(_loc1_ in this.buttons)
         {
            _loc1_.§_-A2n§();
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
      
      protected function §_-33H§() : void
      {
         var _loc1_:int = Math.min(this.buttons.length,this.hotKeys.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            if((this.visible || !this.needVisible) && this.hotKeys[_loc2_] != null)
            {
               this.buttons[_loc2_].§_-M1o§(String.fromCharCode(this.hotKeys[_loc2_]));
            }
            else
            {
               this.buttons[_loc2_].§_-gE§();
            }
            _loc2_++;
         }
      }
      
      protected function get keyCode() : uint
      {
         return 0;
      }
      
      protected function §_-r1i§(param1:KeyboardEvent) : void
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
               this.buttons[_loc3_].§_-H1h§();
               param1.stopImmediatePropagation();
               return;
            }
            _loc3_++;
         }
      }
   }
}

