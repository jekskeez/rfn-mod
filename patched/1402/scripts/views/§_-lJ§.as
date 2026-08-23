package views
{
   import §_-B1G§.ScrollPane;
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-X1k§.§_-XW§;
   import §_-bN§.§_-7y§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import menu.§_-cD§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import utils.§_-r1G§;
   
   public class §_-lJ§ extends Sprite
   {
      
      private static var _instance:§_-lJ§;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #000000;","font-weight: bold;","text-decoration: underline;","}","a {","font-family: \"" + §_-i5§.§_-c10§ + "\";","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private static const §_-81p§:int = §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-V2n§ | §_-Y2E§.§_-rC§;
      
      private var §_-Yh§:Object = {};
      
      private var §_-P1I§:Object = {};
      
      private var §_-b19§:Clan;
      
      private var list:Sprite = new Sprite();
      
      private var §_-W18§:ScrollPane;
      
      private var style:StyleSheet;
      
      public function §_-lJ§()
      {
         super();
         _instance = this;
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
         this.§_-b19§ = §_-B2U§.§_-Q2g§(Game.self["clan_id"]);
         this.§_-W18§ = new ScrollPane();
         this.§_-W18§.setSize(305,185);
         this.§_-W18§.source = this.list;
         addChild(this.§_-W18§);
         Game.listen(this.§_-Y16§);
         this.update();
      }
      
      public static function update() : void
      {
         if(!_instance)
         {
            return;
         }
         _instance.update();
      }
      
      private function update() : void
      {
         var _loc1_:Object = {};
         var _loc2_:Object = {};
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < this.§_-b19§.blacklist.length)
         {
            if(this.§_-b19§.blacklist[_loc4_] in this.§_-Yh§)
            {
               _loc1_[this.§_-b19§.blacklist[_loc4_]] = this.§_-Yh§[this.§_-b19§.blacklist[_loc4_]];
               _loc2_[this.§_-b19§.blacklist[_loc4_]] = this.§_-P1I§[this.§_-b19§.blacklist[_loc4_]];
            }
            else
            {
               _loc3_.push(this.§_-b19§.blacklist[_loc4_]);
            }
            _loc4_++;
         }
         this.§_-Yh§ = _loc1_;
         this.§_-P1I§ = _loc2_;
         this.sort();
         Game.request(_loc3_,§_-81p§,true);
      }
      
      private function §_-61N§(param1:Player) : String
      {
         return "<body><span class=\'self\'>" + §_-r1G§.§_-fU§(param1.name,"event:" + param1.id) + " [" + §_-XW§.§_-Wh§(int(param1["exp"])) + "]</span></body>";
      }
      
      private function sort() : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         while(this.list.numChildren > 0)
         {
            this.list.removeChildAt(0);
         }
         var _loc1_:Array = [];
         for(_loc2_ in this.§_-Yh§)
         {
            _loc1_.push(_loc2_);
         }
         _loc1_.sort(this.§_-i1n§);
         _loc3_ = 0;
         while(_loc3_ < _loc1_.length)
         {
            this.§_-Yh§[_loc1_[_loc3_]].y = 20 * _loc3_;
            this.list.addChild(this.§_-Yh§[_loc1_[_loc3_]]);
            _loc3_++;
         }
         this.§_-W18§.source = this.list;
         this.§_-W18§.update();
      }
      
      private function §_-Y16§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(this.§_-b19§.blacklist.indexOf(_loc2_.id) == -1)
         {
            return;
         }
         if(_loc2_.id in this.§_-Yh§)
         {
            if(_loc2_.isLoaded(§_-Y2E§.§_-V2n§))
            {
               this.§_-P1I§[_loc2_.id].htmlText = this.§_-61N§(_loc2_);
               this.sort();
            }
            return;
         }
         if(!_loc2_.isLoaded(§_-Y2E§.§_-n2H§))
         {
            return;
         }
         var _loc3_:§_-i5§ = new §_-i5§(this.§_-61N§(_loc2_),0,0,this.style,255);
         _loc3_.userData = _loc2_.id;
         _loc3_.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-e25§);
         this.§_-P1I§[_loc2_.id] = _loc3_;
         var _loc4_:HideDecorationButton = new HideDecorationButton();
         _loc4_.name = String(_loc2_.id);
         _loc4_.x = 272;
         _loc4_.addEventListener(MouseEvent.CLICK,this.§_-x2B§);
         var _loc5_:Sprite = new Sprite();
         _loc5_.addChild(_loc3_);
         _loc5_.addChild(_loc4_);
         this.§_-Yh§[_loc2_.id] = _loc5_;
         this.sort();
      }
      
      private function §_-e25§(param1:MouseEvent) : void
      {
         §_-cD§.§_-e25§(int(§_-i5§(param1.currentTarget).userData));
      }
      
      private function §_-x2B§(param1:MouseEvent) : void
      {
         var rowText:String;
         var dialogOutBlacklist:§_-7y§;
         var playerId:int = 0;
         var e:MouseEvent = param1;
         e.stopImmediatePropagation();
         playerId = int(e.currentTarget.name);
         rowText = this.§_-P1I§[playerId].text;
         dialogOutBlacklist = new §_-7y§(gls("Удалить из черного списка клана"),gls("Ты уверен, что хочешь удалить\n{0} из черного списка клана?",rowText),function():void
         {
            Connection.§_-e2T§(§_-u1O§.§_-22c§,playerId);
         });
         dialogOutBlacklist.show();
      }
      
      private function §_-i1n§(param1:int, param2:int) : int
      {
         var _loc3_:Player = Game.getPlayer(param1);
         var _loc4_:Player = Game.getPlayer(param2);
         var _loc5_:int = int(_loc3_["exp"]);
         var _loc6_:int = int(_loc4_["exp"]);
         if(_loc5_ != _loc6_)
         {
            return _loc6_ - _loc5_;
         }
         return param1 - param2;
      }
   }
}

