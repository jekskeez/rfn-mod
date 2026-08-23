package §_-rT§
{
   import §_-92M§.§_-Qm§;
   import §_-92M§.§_-X2z§;
   import §_-C2a§.§_-ml§;
   import §_-S1D§.§_-O1M§;
   import flash.ui.Keyboard;
   import protocol.§_-S2I§;
   
   public class §_-h1g§ extends §_-Qm§
   {
      
      private static const §_-A2s§:Number = 43;
      
      private static const §_-A1m§:Number = 5;
      
      private static var _instance:§_-h1g§;
      
      public function §_-h1g§()
      {
         super();
         _instance = this;
         this.§_-kH§.y = -§_-A1m§;
         var _loc1_:int = §_-ml§.§_-Jq§;
         while(_loc1_ < §_-ml§.§_-I1l§)
         {
            this.addButton(new §_-zS§(_loc1_));
            _loc1_++;
         }
         _instance.updateButtons();
         _instance.§_-q2S§();
      }
      
      public static function set hero(param1:Hero) : void
      {
         var _loc2_:§_-zS§ = null;
         for each(_loc2_ in _instance.buttons)
         {
            _loc2_.hero = param1;
         }
      }
      
      override public function addButton(param1:§_-X2z§) : void
      {
         param1.x = this.buttons.length * §_-A2s§;
         super.addButton(param1);
      }
      
      override public function get perksAvailable() : Boolean
      {
         return §_-O1M§.§_-F2g§ == §_-S2I§.ROUND_START && (Boolean(§_-O1M§.hero) && §_-O1M§.hero.isDragon);
      }
      
      override protected function get hotKeys() : Array
      {
         return [null,Keyboard.NUMBER_1];
      }
      
      override protected function get needVisible() : Boolean
      {
         return false;
      }
   }
}

