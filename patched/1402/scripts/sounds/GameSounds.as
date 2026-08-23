package sounds
{
   import flash.events.Event;
   import flash.media.SoundChannel;
   import game.mainGame.entity.§_-xn§;
   
   public class GameSounds extends §_-A1z§
   {
      
      private static var _instance:GameSounds;
      
      private var §_-mv§:Object = {};
      
      private var §_-82n§:Object = {};
      
      public function GameSounds()
      {
         super();
         _instance = this;
      }
      
      public static function get on() : Boolean
      {
         return _instance.§_-tn§;
      }
      
      public static function §_-zY§(param1:Array) : void
      {
         _instance.§_-zY§(param1);
      }
      
      public static function set on(param1:Boolean) : void
      {
         _instance.§_-tn§ = param1;
      }
      
      public static function play(param1:String, param2:Boolean = false) : SoundChannel
      {
         return _instance.play(param1,param2);
      }
      
      public static function §_-411§(param1:String, param2:Number) : void
      {
         if(_instance.§_-k2e§[param1] != null)
         {
            return;
         }
         _instance.play(param1);
         _instance.§_-j1P§(param1,param2);
      }
      
      public static function §_-8B§(param1:String) : void
      {
         _instance.§_-a1L§(param1);
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
      
      public static function §_-C1K§(param1:§_-xn§) : void
      {
         GameSounds.play(§_-RH§.§_-g11§[(param1 as Object).constructor] || "poyavlenie_object");
      }
      
      override protected function stop(param1:SoundChannel) : void
      {
         var _loc2_:String = null;
         if(param1 == null)
         {
            return;
         }
         param1.stop();
         if(param1 in this.§_-t2R§)
         {
            delete this.§_-t2R§[param1];
         }
         if(param1 in this.§_-82n§)
         {
            _loc2_ = this.§_-82n§[param1];
            delete this.§_-82n§[param1];
            delete this.§_-mv§[_loc2_];
         }
      }
      
      private function playUnrepeatable(param1:String) : SoundChannel
      {
         var channel:SoundChannel = null;
         var name:String = param1;
         §_-p2U§.add("sounds.GameSounds.playUnrepeatable");
         if(!this.§_-tn§)
         {
            return null;
         }
         if(!(name in this.§_-m1S§))
         {
            §_-u8§(name);
            return null;
         }
         try
         {
            if(name in this.§_-mv§ && this.§_-mv§[name] in this.§_-82n§)
            {
               return this.§_-mv§[name];
            }
            channel = this.§_-m1S§[name].play();
            channel.addEventListener(Event.SOUND_COMPLETE,this.§_-y26§,false,0,true);
            this.§_-mv§[name] = channel;
            this.§_-82n§[channel] = name;
            return this.§_-mv§[name];
         }
         catch(error:Error)
         {
            §_-p2U§.add("Failed to play sound: " + error);
         }
         return null;
      }
      
      private function §_-y26§(param1:Event) : void
      {
         var _loc2_:SoundChannel = param1.target as SoundChannel;
         var _loc3_:String = this.§_-82n§[_loc2_];
         delete this.§_-82n§[_loc2_];
         delete this.§_-mv§[_loc3_];
      }
   }
}

