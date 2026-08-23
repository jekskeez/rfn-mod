package §_-X2V§
{
   import flash.events.Event;
   
   public class SquirrelEvent extends Event
   {
      
      public static const §_-Xw§:String = "SquirrelEvent.acorn";
      
      public static const §_-Z2N§:String = "SquirrelEvent.shaman";
      
      public static const §_-rR§:String = "SquirrelEvent.scrat";
      
      public static const §_-71l§:String = "SquirrelEvent.hare";
      
      public static const §_-Z1h§:String = "SquirrelEvent.dragon";
      
      public static const §_-pZ§:String = "SquirrelEvent.reset";
      
      public static const §_-R1y§:String = "SquirrelEvent.respawn";
      
      public static const HIDE:String = "SquirrelEvent.hide";
      
      public static const §_-E25§:String = "SquirrelEvent.die";
      
      public static const §_-M15§:String = "SquirrelEvent.leave";
      
      public static const §_-TH§:String = "SquirrelEvent.join";
      
      public static const §_-F2W§:String = "SquirrelEvent.team";
      
      public static const §_-P2y§:String = "SquirrelEvent.emotion";
      
      public static const §_-re§:String = "SquirrelEvent.olympicCoin";
      
      public static const §_-f2P§:String = "SquirrelEvent.ghost";
      
      public static const §_-L5§:String = "SquirrelEvent.respawnPoint";
      
      public var player:Hero;
      
      public function SquirrelEvent(param1:String, param2:Hero)
      {
         super(param1);
         this.player = param2;
      }
   }
}

