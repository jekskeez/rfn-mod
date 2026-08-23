package §_-I10§
{
   import §_-k1c§.§_-9f§;
   import events.NotificationEvent;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import views.§_-E8§;
   
   public class NotificationManager
   {
      
      private static var _instance:NotificationManager;
      
      private static var _type:int = 0;
      
      public static const §_-M0§:uint = 1 << _type;
      
      public static const §_-D14§:uint = 1 << ++_type;
      
      public static const §_-X1A§:uint = 1 << ++_type;
      
      public static const §_-C2F§:uint = 1 << ++_type;
      
      public static const §_-V1P§:uint = 1 << ++_type;
      
      public static const §_-K12§:uint = 1 << ++_type;
      
      public static const DAILY_QUEST:uint = 1 << ++_type;
      
      public static const §_-Ee§:uint = 1 << ++_type;
      
      public var §_-S2r§:int = -1;
      
      private var §_-A2m§:Vector.<NotificationData> = Vector.<NotificationData>([]);
      
      private var §_-g1J§:int = 0;
      
      private var §_-s2s§:uint = 0;
      
      public function NotificationManager()
      {
         super();
         §_-82N§.addCallback(§_-82N§.§_-K7§,this.onLoad);
         §_-fO§.instance.addEventListener(NotificationEvent.SHOW,this.§_-027§);
         §_-fO§.instance.addEventListener(NotificationEvent.HIDE,this.§_-y1b§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-92j§]);
      }
      
      public static function get instance() : NotificationManager
      {
         return _instance = _instance || new NotificationManager();
      }
      
      public function §_-P2Y§(param1:uint, param2:§_-E8§) : void
      {
         var _loc3_:NotificationData = null;
         for each(_loc3_ in this.§_-A2m§)
         {
            if(_loc3_.view == param2)
            {
               new Error("This notification by type #" + param1 + " already registered!");
            }
         }
         param2.active = (param1 & this.§_-s2s§) > 0;
         this.§_-A2m§.push(new NotificationData(param1,param2));
      }
      
      public function §_-42O§(param1:int) : void
      {
         var _loc2_:Object = §_-82N§.load(§_-82N§.§_-K7§);
         _loc2_["news_id"] = param1;
         §_-82N§.save(§_-82N§.§_-K7§,_loc2_);
         §_-fO§.hide(§_-K12§);
      }
      
      private function onLoad() : void
      {
         var _loc1_:Object = §_-82N§.load(§_-82N§.§_-K7§);
         if(_loc1_["news_id"] != §_-9f§.§_-xf§)
         {
            this.§_-S2r§ = _loc1_["news_id"];
            §_-fO§.show(§_-K12§);
         }
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         this.§_-g1J§ = 0;
      }
      
      private function §_-y1b§(param1:NotificationEvent) : void
      {
         this.§_-s2s§ &= ~param1.§_-B3F§;
         this.update();
      }
      
      private function §_-027§(param1:NotificationEvent) : void
      {
         this.§_-s2s§ |= param1.§_-B3F§;
         this.update();
      }
      
      private function update() : void
      {
         var _loc1_:NotificationData = null;
         for each(_loc1_ in this.§_-A2m§)
         {
            _loc1_.view.active = (_loc1_._type & this.§_-s2s§) > 0;
         }
      }
   }
}

import views.§_-E8§;

class NotificationData
{
   
   public var _type:uint = 0;
   
   public var view:§_-E8§;
   
   public function NotificationData(param1:uint, param2:§_-E8§)
   {
      super();
      this._type = param1;
      this.view = param2;
   }
}
