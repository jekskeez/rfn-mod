package §_-ZL§
{
   import §_-B1G§.§_-U1c§;
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-72U§;
   
   public class §_-TF§ extends Dialog
   {
      
      private static const §_-A3C§:int = 10;
      
      private static const §_-S9§:int = 220;
      
      private static const §_-e2q§:int = 200;
      
      private static var _instance:§_-TF§ = null;
      
      private var list:§_-U1c§;
      
      private var §_-g1V§:§_-72U§ = null;
      
      private var §_-q6§:Object = {};
      
      public function §_-TF§()
      {
         _instance = this;
         super();
         this.init();
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-E2A§]);
         Game.listen(this.§_-Y16§);
      }
      
      public static function show() : void
      {
         if(!_instance)
         {
            new §_-TF§();
         }
         _instance.show();
         Connection.§_-e2T§(§_-u1O§.§_-E2A§);
      }
      
      private function init() : void
      {
         this.list = new §_-U1c§(§_-S9§,§_-e2q§);
         this.list.x = §_-A3C§;
         this.list.y = 10;
         this.list.addEventListener(Event.CHANGE,this.§_-e15§);
         addChild(this.list);
         var _loc1_:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,6175017);
         var _loc2_:§_-i5§ = new §_-i5§(gls("Проверено карт:"),§_-A3C§,this.list.y + §_-e2q§ + 8,_loc1_);
         addChild(_loc2_);
         this.§_-g1V§ = new §_-72U§("",§_-A3C§,_loc2_.y + 18,90,15,_loc1_);
         addChild(this.§_-g1V§);
         var _loc3_:§_-K2G§ = new §_-K2G§(gls("Начислить"));
         _loc3_.x = §_-A3C§ + 100;
         _loc3_.y = _loc2_.y + 14;
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-X2h§);
         addChild(_loc3_);
         place();
         this.width += 25;
         this.height += 45;
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc5_:Object = null;
         if(param1[0].length == 0)
         {
            return;
         }
         this.list.removeAll();
         this.§_-q6§ = {};
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < param1[0].length)
         {
            _loc5_ = {
               "label":param1[0][_loc4_],
               "value":param1[0][_loc4_ + 1],
               "bold":true
            };
            _loc3_.push(_loc5_);
            this.§_-q6§[param1[0][_loc4_]] = _loc5_;
            _loc2_.push(param1[0][_loc4_]);
            _loc4_ += 2;
         }
         this.list.§_-533§(_loc3_);
         this.§_-e15§();
         Game.request(_loc2_,§_-Y2E§.§_-n2H§);
      }
      
      private function §_-Y16§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(!(_loc2_["id"] in this.§_-q6§))
         {
            return;
         }
         var _loc3_:Object = this.§_-q6§[_loc2_["id"]];
         _loc3_["label"] = _loc3_["label"] + "     " + _loc2_.name;
         delete this.§_-q6§[_loc2_["id"]];
         this.list.§_-iJ§();
      }
      
      private function §_-e15§(param1:Event = null) : void
      {
         if(!this.list.§_-E2v§)
         {
            return;
         }
         this.§_-g1V§.text = this.list.§_-E2v§["value"];
      }
      
      private function §_-X2h§(param1:MouseEvent) : void
      {
         if(!this.list.§_-E2v§ || this.list.§_-E2v§["value"] < this.§_-g1V§.text)
         {
            return;
         }
         this.list.§_-E2v§["value"] = this.§_-g1V§.text;
         var _loc2_:String = this.list.§_-E2v§["label"];
         Connection.§_-e2T§(§_-u1O§.§_-E2A§,_loc2_.split("     ")[0],this.list.§_-E2v§["value"]);
         Connection.§_-e2T§(§_-u1O§.§_-E2A§);
      }
   }
}

