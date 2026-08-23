package §_-8I§
{
   import flash.events.Event;
   
   public class SquirrelEvent extends Event
   {
      
      public static const §_-62z§:String = "SquirrelEvent.acorn";
      
      public static const §_-S2i§:String = "SquirrelEvent.shaman";
      
      public static const §_-q1G§:String = "SquirrelEvent.scrat";
      
      public static const §_-E2R§:String = "SquirrelEvent.hare";
      
      public static const §_-c2v§:String = "SquirrelEvent.dragon";
      
      public static const §_-f2m§:String = "SquirrelEvent.reset";
      
      public static const §_-f13§:String = "SquirrelEvent.respawn";
      
      public static const HIDE:String = "SquirrelEvent.hide";
      
      public static const §_-z1B§:String = "SquirrelEvent.die";
      
      public static const §_-n1x§:String = "SquirrelEvent.leave";
      
      public static const §_-O2n§:String = "SquirrelEvent.join";
      
      public static const §_-i11§:String = "SquirrelEvent.team";
      
      public static const §_-G1f§:String = "SquirrelEvent.emotion";
      
      public static const §_-P2f§:String = "SquirrelEvent.olympicCoin";
      
      public static const §_-722§:String = "SquirrelEvent.ghost";
      
      public static const §_-8E§:String = "SquirrelEvent.respawnPoint";
      
      public var player:Hero;
      
      public function SquirrelEvent(param1:String, param2:Hero)
      {
         super(param1);
         this.player = param2;
      }
   }
}

