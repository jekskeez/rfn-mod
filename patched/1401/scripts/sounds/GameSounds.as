package sounds
{
   import flash.events.Event;
   import flash.media.SoundChannel;
   import game.mainGame.entity.§_-63Q§;
   
   public class GameSounds extends §_-yd§
   {
      
      private static var _instance:GameSounds;
      
      private var §_-Z1m§:Object = {};
      
      private var §_-S2x§:Object = {};
      
      public function GameSounds()
      {
         super();
         _instance = this;
      }
      
      public static function get on() : Boolean
      {
         return _instance.§_-62s§;
      }
      
      public static function §_-wL§(param1:Array) : void
      {
         _instance.§_-wL§(param1);
      }
      
      public static function set on(param1:Boolean) : void
      {
         _instance.§_-62s§ = param1;
      }
      
      public static function play(param1:String, param2:Boolean = false) : SoundChannel
      {
         return _instance.play(param1,param2);
      }
      
      public static function §_-A3A§(param1:String, param2:Number) : void
      {
         if(_instance.§_-g2F§[param1] != null)
         {
            return;
         }
         _instance.play(param1);
         _instance.§_-q2V§(param1,param2);
      }
      
      public static function §_-x1y§(param1:String) : void
      {
         _instance.§_-JE§(param1);
      }
      
      public static function playUnrepeatable(param1:String, param2:Number = 1) : SoundChannel
      {
         if(param2 != 1)
         {
            if(param2 < 0 || param2 > 1)
            {
               return null;
            }
            if(Math.random() > param2)
            {
               return null;
            }
         }
         return _instance.playUnrepeatable(param1);
      }
      
      public static function stop(param1:SoundChannel) : void
      {
         _instance.stop(param1);
      }
      
      public static function stopAll() : void
      {
         _instance.stopAll();
      }
      
      public static function §_-1g§(param1:§_-63Q§) : void
      {
         GameSounds.play(§_-43Z§.§_-v18§[(param1 as Object).constructor] || "poyavlenie_object");
      }
      
      override protected function stop(param1:SoundChannel) : void
      {
         var _loc2_:String = null;
         if(param1 == null)
         {
            return;
         }
         param1.stop();
         if(param1 in this.§_-c1B§)
         {
            delete this.§_-c1B§[param1];
         }
         if(param1 in this.§_-S2x§)
         {
            _loc2_ = this.§_-S2x§[param1];
            delete this.§_-S2x§[param1];
            delete this.§_-Z1m§[_loc2_];
         }
      }
      
      private function playUnrepeatable(param1:String) : SoundChannel
      {
         var channel:SoundChannel = null;
         var name:String = param1;
         §_-TQ§.add("sounds.GameSounds.playUnrepeatable");
         if(!this.§_-62s§)
         {
            return null;
         }
         if(!(name in this.§_-xQ§))
         {
            §_-fV§(name);
            return null;
         }
         try
         {
            if(name in this.§_-Z1m§ && this.§_-Z1m§[name] in this.§_-S2x§)
            {
               return this.§_-Z1m§[name];
            }
            channel = this.§_-xQ§[name].play();
            channel.addEventListener(Event.SOUND_COMPLETE,this.§_-8X§,false,0,true);
            this.§_-Z1m§[name] = channel;
            this.§_-S2x§[channel] = name;
            return this.§_-Z1m§[name];
         }
         catch(error:Error)
         {
            §_-TQ§.add("Failed to play sound: " + error);
         }
         return null;
      }
      
      private function §_-8X§(param1:Event) : void
      {
         var _loc2_:SoundChannel = param1.target as SoundChannel;
         var _loc3_:String = this.§_-S2x§[_loc2_];
         delete this.§_-S2x§[_loc2_];
         delete this.§_-Z1m§[_loc3_];
      }
   }
}

