package §_-Q1P§
{
   import §_-Kr§.§_-12w§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-w2j§;
   
   public class §_-C1p§ extends Dialog
   {
      
      private static const §_-V0§:int = 10;
      
      private static const §_-y1X§:int = 220;
      
      private static const §_-92X§:int = 200;
      
      private static var _instance:§_-C1p§ = null;
      
      private var list:§_-12w§;
      
      private var §_-m16§:§_-w2j§ = null;
      
      private var §_-33K§:Object = {};
      
      public function §_-C1p§()
      {
         _instance = this;
         super();
         this.init();
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-1O§]);
         Game.listen(this.§_-P9§);
      }
      
      public static function show() : void
      {
         if(!_instance)
         {
            new §_-C1p§();
         }
         _instance.show();
         Connection.§_-Li§(§_-h2B§.§_-1O§);
      }
      
      private function init() : void
      {
         this.list = new §_-12w§(§_-y1X§,§_-92X§);
         this.list.x = §_-V0§;
         this.list.y = 10;
         this.list.addEventListener(Event.CHANGE,this.§_-C2r§);
         addChild(this.list);
         var _loc1_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,6175017);
         var _loc2_:§_-22V§ = new §_-22V§(gls("Проверено карт:"),§_-V0§,this.list.y + §_-92X§ + 8,_loc1_);
         addChild(_loc2_);
         this.§_-m16§ = new §_-w2j§("",§_-V0§,_loc2_.y + 18,90,15,_loc1_);
         addChild(this.§_-m16§);
         var _loc3_:§_-j18§ = new §_-j18§(gls("Начислить"));
         _loc3_.x = §_-V0§ + 100;
         _loc3_.y = _loc2_.y + 14;
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-23f§);
         addChild(_loc3_);
         place();
         this.width += 25;
         this.height += 45;
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc5_:Object = null;
         if(param1[0].length == 0)
         {
            return;
         }
         this.list.removeAll();
         this.§_-33K§ = {};
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
            this.§_-33K§[param1[0][_loc4_]] = _loc5_;
            _loc2_.push(param1[0][_loc4_]);
            _loc4_ += 2;
         }
         this.list.§_-K26§(_loc3_);
         this.§_-C2r§();
         Game.request(_loc2_,§_-hF§.§_-31q§);
      }
      
      private function §_-P9§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(!(_loc2_["id"] in this.§_-33K§))
         {
            return;
         }
         var _loc3_:Object = this.§_-33K§[_loc2_["id"]];
         _loc3_["label"] = _loc3_["label"] + "     " + _loc2_.name;
         delete this.§_-33K§[_loc2_["id"]];
         this.list.§_-f19§();
      }
      
      private function §_-C2r§(param1:Event = null) : void
      {
         if(!this.list.§_-l1§)
         {
            return;
         }
         this.§_-m16§.text = this.list.§_-l1§["value"];
      }
      
      private function §_-23f§(param1:MouseEvent) : void
      {
         if(!this.list.§_-l1§ || this.list.§_-l1§["value"] < this.§_-m16§.text)
         {
            return;
         }
         this.list.§_-l1§["value"] = this.§_-m16§.text;
         var _loc2_:String = this.list.§_-l1§["label"];
         Connection.§_-Li§(§_-h2B§.§_-1O§,_loc2_.split("     ")[0],this.list.§_-l1§["value"]);
         Connection.§_-Li§(§_-h2B§.§_-1O§);
      }
   }
}

