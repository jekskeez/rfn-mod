package views
{
   import §_-I10§.§_-My§;
   import §_-Kr§.ScrollPane;
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import §_-k1c§.§_-V2t§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import menu.§_-927§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import utils.§_-xb§;
   
   public class §_-fu§ extends Sprite
   {
      
      private static var _instance:§_-fu§;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #000000;","font-weight: bold;","text-decoration: underline;","}","a {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private static const §_-zX§:int = §_-hF§.§_-31q§ | §_-hF§.§_-P13§ | §_-hF§.§_-k2y§;
      
      private var §_-M2a§:Object = {};
      
      private var §_-p15§:Object = {};
      
      private var §_-81t§:Clan;
      
      private var list:Sprite = new Sprite();
      
      private var §_-M1N§:ScrollPane;
      
      private var style:StyleSheet;
      
      public function §_-fu§()
      {
         super();
         _instance = this;
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         this.§_-81t§ = §_-e2W§.§_-W2X§(Game.self["clan_id"]);
         this.§_-M1N§ = new ScrollPane();
         this.§_-M1N§.setSize(305,185);
         this.§_-M1N§.source = this.list;
         addChild(this.§_-M1N§);
         Game.listen(this.§_-P9§);
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
         while(_loc4_ < this.§_-81t§.blacklist.length)
         {
            if(this.§_-81t§.blacklist[_loc4_] in this.§_-M2a§)
            {
               _loc1_[this.§_-81t§.blacklist[_loc4_]] = this.§_-M2a§[this.§_-81t§.blacklist[_loc4_]];
               _loc2_[this.§_-81t§.blacklist[_loc4_]] = this.§_-p15§[this.§_-81t§.blacklist[_loc4_]];
            }
            else
            {
               _loc3_.push(this.§_-81t§.blacklist[_loc4_]);
            }
            _loc4_++;
         }
         this.§_-M2a§ = _loc1_;
         this.§_-p15§ = _loc2_;
         this.sort();
         Game.request(_loc3_,§_-zX§,true);
      }
      
      private function §_-P2E§(param1:Player) : String
      {
         return "<body><span class=\'self\'>" + §_-xb§.§_-e1r§(param1.name,"event:" + param1.id) + " [" + §_-My§.§_-n1z§(int(param1["exp"])) + "]</span></body>";
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
         for(_loc2_ in this.§_-M2a§)
         {
            _loc1_.push(_loc2_);
         }
         _loc1_.sort(this.§_-e2G§);
         _loc3_ = 0;
         while(_loc3_ < _loc1_.length)
         {
            this.§_-M2a§[_loc1_[_loc3_]].y = 20 * _loc3_;
            this.list.addChild(this.§_-M2a§[_loc1_[_loc3_]]);
            _loc3_++;
         }
         this.§_-M1N§.source = this.list;
         this.§_-M1N§.update();
      }
      
      private function §_-P9§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(this.§_-81t§.blacklist.indexOf(_loc2_.id) == -1)
         {
            return;
         }
         if(_loc2_.id in this.§_-M2a§)
         {
            if(_loc2_.isLoaded(§_-hF§.§_-P13§))
            {
               this.§_-p15§[_loc2_.id].htmlText = this.§_-P2E§(_loc2_);
               this.sort();
            }
            return;
         }
         if(!_loc2_.isLoaded(§_-hF§.§_-31q§))
         {
            return;
         }
         var _loc3_:§_-22V§ = new §_-22V§(this.§_-P2E§(_loc2_),0,0,this.style,255);
         _loc3_.userData = _loc2_.id;
         _loc3_.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-i2I§);
         this.§_-p15§[_loc2_.id] = _loc3_;
         var _loc4_:HideDecorationButton = new HideDecorationButton();
         _loc4_.name = String(_loc2_.id);
         _loc4_.x = 272;
         _loc4_.addEventListener(MouseEvent.CLICK,this.§_-s23§);
         var _loc5_:Sprite = new Sprite();
         _loc5_.addChild(_loc3_);
         _loc5_.addChild(_loc4_);
         this.§_-M2a§[_loc2_.id] = _loc5_;
         this.sort();
      }
      
      private function §_-i2I§(param1:MouseEvent) : void
      {
         §_-927§.§_-i2I§(int(§_-22V§(param1.currentTarget).userData));
      }
      
      private function §_-s23§(param1:MouseEvent) : void
      {
         var rowText:String;
         var dialogOutBlacklist:§_-V2t§;
         var playerId:int = 0;
         var e:MouseEvent = param1;
         e.stopImmediatePropagation();
         playerId = int(e.currentTarget.name);
         rowText = this.§_-p15§[playerId].text;
         dialogOutBlacklist = new §_-V2t§(gls("Удалить из черного списка клана"),gls("Ты уверен, что хочешь удалить\n{0} из черного списка клана?",rowText),function():void
         {
            Connection.§_-Li§(§_-h2B§.§_-x1v§,playerId);
         });
         dialogOutBlacklist.show();
      }
      
      private function §_-e2G§(param1:int, param2:int) : int
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

