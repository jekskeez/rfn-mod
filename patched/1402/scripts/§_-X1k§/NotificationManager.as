package §_-X1k§
{
   import §_-bN§.§_-RY§;
   import events.NotificationEvent;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import views.§_-O2q§;
   
   public class NotificationManager
   {
      
      private static var _instance:NotificationManager;
      
      private static var _type:int = 0;
      
      public static const §_-Xd§:uint = 1 << _type;
      
      public static const §_-J1u§:uint = 1 << ++_type;
      
      public static const §_-K2A§:uint = 1 << ++_type;
      
      public static const §_-53c§:uint = 1 << ++_type;
      
      public static const §_-T1Z§:uint = 1 << ++_type;
      
      public static const §_-FM§:uint = 1 << ++_type;
      
      public static const DAILY_QUEST:uint = 1 << ++_type;
      
      public static const §_-b1B§:uint = 1 << ++_type;
      
      public var §_-m1X§:int = -1;
      
      private var §_-Gi§:Vector.<NotificationData> = Vector.<NotificationData>([]);
      
      private var §_-X§:int = 0;
      
      private var §_-z2n§:uint = 0;
      
      public function NotificationManager()
      {
         super();
         §_-u2n§.addCallback(§_-u2n§.§_-P1g§,this.onLoad);
         §_-L1H§.instance.addEventListener(NotificationEvent.SHOW,this.§_-O1s§);
         §_-L1H§.instance.addEventListener(NotificationEvent.HIDE,this.§_-M2s§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-rV§]);
      }
      
      public static function get instance() : NotificationManager
      {
         return _instance = _instance || new NotificationManager();
      }
      
      public function §_-a1K§(param1:uint, param2:§_-O2q§) : void
      {
         var _loc3_:NotificationData = null;
         for each(_loc3_ in this.§_-Gi§)
         {
            if(_loc3_.view == param2)
            {
               new Error("This notification by type #" + param1 + " already registered!");
            }
         }
         param2.active = (param1 & this.§_-z2n§) > 0;
         this.§_-Gi§.push(new NotificationData(param1,param2));
      }
      
      public function §_-I3§(param1:int) : void
      {
         var _loc2_:Object = §_-u2n§.load(§_-u2n§.§_-P1g§);
         _loc2_["news_id"] = param1;
         §_-u2n§.save(§_-u2n§.§_-P1g§,_loc2_);
         §_-L1H§.hide(§_-FM§);
      }
      
      private function onLoad() : void
      {
         var _loc1_:Object = §_-u2n§.load(§_-u2n§.§_-P1g§);
         if(_loc1_["news_id"] != §_-RY§.§_-W1s§)
         {
            this.§_-m1X§ = _loc1_["news_id"];
            §_-L1H§.show(§_-FM§);
         }
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         this.§_-X§ = 0;
      }
      
      private function §_-M2s§(param1:NotificationEvent) : void
      {
         this.§_-z2n§ &= ~param1.§_-H16§;
         this.update();
      }
      
      private function §_-O1s§(param1:NotificationEvent) : void
      {
         this.§_-z2n§ |= param1.§_-H16§;
         this.update();
      }
      
      private function update() : void
      {
         var _loc1_:NotificationData = null;
         for each(_loc1_ in this.§_-Gi§)
         {
            _loc1_.view.active = (_loc1_._type & this.§_-z2n§) > 0;
         }
      }
   }
}

import views.§_-O2q§;

class NotificationData
{
   
   public var _type:uint = 0;
   
   public var view:§_-O2q§;
   
   public function NotificationData(param1:uint, param2:§_-O2q§)
   {
      super();
      this._type = param1;
      this.view = param2;
   }
}
