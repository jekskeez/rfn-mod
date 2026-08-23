package §_-vz§
{
   import §_-61C§.§_-a2p§;
   import §_-HG§.§_-i1N§;
   import §_-HG§.§_-w2L§;
   import §_-X1g§.§_-s2y§;
   import flash.ui.Keyboard;
   import protocol.§_-s2l§;
   
   public class §_-r20§ extends §_-i1N§
   {
      
      private static const §_-l2V§:Number = 43;
      
      private static const §_-Fz§:Number = 5;
      
      private static var _instance:§_-r20§;
      
      public function §_-r20§()
      {
         super();
         _instance = this;
         this.§_-E1l§.y = -§_-Fz§;
         var _loc1_:int = §_-s2y§.§_-WL§;
         while(_loc1_ < §_-s2y§.§_-83P§)
         {
            this.addButton(new §_-ur§(_loc1_));
            _loc1_++;
         }
         _instance.updateButtons();
         _instance.§_-33H§();
      }
      
      public static function set hero(param1:Hero) : void
      {
         var _loc2_:§_-ur§ = null;
         for each(_loc2_ in _instance.buttons)
         {
            _loc2_.hero = param1;
         }
      }
      
      override public function addButton(param1:§_-w2L§) : void
      {
         param1.x = this.buttons.length * §_-l2V§;
         super.addButton(param1);
      }
      
      override public function get perksAvailable() : Boolean
      {
         return §_-a2p§.§_-j2F§ == §_-s2l§.ROUND_START && (Boolean(§_-a2p§.hero) && §_-a2p§.hero.isDragon);
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

