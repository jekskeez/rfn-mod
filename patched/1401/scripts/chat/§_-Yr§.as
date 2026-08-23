package chat
{
   import §_-dc§.§_-e2W§;
   import events.ClanNoticeEvent;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import menu.§_-927§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-Yr§ extends §_-11X§
   {
      
      private static const §_-i1m§:int = 0;
      
      private static const §_-m1c§:int = 80;
      
      private static const §_-L1R§:int = 28;
      
      private static const §_-K1q§:Number = 13.75;
      
      private static const §_-216§:int = 100;
      
      private static var §_-uB§:BitmapData = null;
      
      private static var §_-f1E§:BitmapData = null;
      
      private static const §_-I2U§:String = [".playerName {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #000000;","font-weight: bold;","}",".leaderName {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #000000;","font-weight: bold;","}",".subLeaderName {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #000000;","font-weight: bold;","}",".message {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #000000;","}","a {","text-decoration: underline;","}","","a:hover {","text-decoration: none;","}"].join("\n");
      
      private var §_-d1T§:int = 0;
      
      private var §_-y2p§:Boolean = false;
      
      private var §_-oR§:Array = [§_-3y§.§_-f2V§,§_-3y§.§_-K2n§];
      
      public function §_-Yr§()
      {
         super();
         style = new StyleSheet();
         style.parseCSS(§_-I2U§);
         §_-e2W§.listen(this.update,ClanNoticeEvent.CLAN_TRANSACTIONS_UPDATE);
      }
      
      public static function get §_-51s§() : BitmapData
      {
         var _loc1_:ImageIconNut = null;
         var _loc2_:Sprite = null;
         if(!§_-uB§)
         {
            _loc1_ = new ImageIconNut();
            _loc1_.height = 16;
            _loc1_.scaleX = _loc1_.scaleY;
            _loc2_ = new Sprite();
            _loc2_.addChild(_loc1_);
            §_-uB§ = new BitmapData(_loc2_.width,_loc2_.height,true,16777215);
            §_-uB§.draw(_loc2_);
         }
         return §_-uB§;
      }
      
      public static function get §_-e1j§() : BitmapData
      {
         var _loc1_:ImageIconCoins = null;
         var _loc2_:Sprite = null;
         if(!§_-f1E§)
         {
            _loc1_ = new ImageIconCoins();
            _loc1_.height = 16;
            _loc1_.scaleX = _loc1_.scaleY;
            _loc2_ = new Sprite();
            _loc2_.addChild(_loc1_);
            §_-f1E§ = new BitmapData(_loc2_.width,_loc2_.height,true,16777215);
            §_-f1E§.draw(_loc2_);
         }
         return §_-f1E§;
      }
      
      override public function §_-7M§(param1:int) : void
      {
         super.§_-7M§(param1 - §_-m1c§);
      }
      
      override public function sendMessage(param1:String) : void
      {
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-y2p§ = false;
      }
      
      override public function §_-D1L§() : void
      {
         super.§_-D1L§();
         this.§_-d1T§ = 0;
         this.graphics.clear();
      }
      
      override public function §_-027§() : void
      {
         super.§_-027§();
         this.request();
      }
      
      override protected function listen() : void
      {
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-z1y§]);
      }
      
      override protected function §_-l1i§(param1:§_-dd§) : void
      {
         var _loc2_:§_-22V§ = new §_-22V§("",0,0,style);
         _loc2_.htmlText = "<textformat leading=\"1\">" + param1.text + "</textformat><BR>";
         _loc2_.width = §_-2f§;
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         _loc2_.embedFonts = true;
         _loc2_.userData = param1.userId;
         _loc2_.antiAliasType = AntiAliasType.ADVANCED;
         _loc2_.gridFitType = GridFitType.PIXEL;
         _loc2_.thickness = 100;
         _loc2_.sharpness = 0;
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-o1P§);
         _loc2_.y = §_-oq§.length ? §_-oq§[§_-oq§.length - 1].y + §_-oq§[§_-oq§.length - 1].height : 0;
         if(§_-oq§.length == 0)
         {
            _loc2_.y += §_-K1q§;
         }
         §_-oq§.push(_loc2_);
         this.§_-73N§(param1);
         this.§_-j1J§();
         this.addChild(_loc2_);
      }
      
      protected function §_-aH§(param1:int, param2:int = 2, param3:String = "0") : String
      {
         var _loc4_:String = String(param1);
         while(_loc4_.length < param2)
         {
            _loc4_ = param3 + _loc4_;
         }
         return _loc4_;
      }
      
      override protected function §_-62Y§() : void
      {
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(!this.§_-y2p§)
         {
            return;
         }
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1[0].length)
         {
            _loc2_.push({
               "player_id":param1[0][_loc3_],
               "type":param1[0][_loc3_ + 1],
               "coins":param1[0][_loc3_ + 2],
               "acorns":param1[0][_loc3_ + 3],
               "data":param1[0][_loc3_ + 4],
               "time":param1[0][_loc3_ + 5]
            });
            _loc3_ += 6;
         }
         _loc2_.sortOn("time",Array.NUMERIC);
         var _loc4_:int = Math.max(0,_loc2_.length - §_-216§);
         _loc3_ = _loc4_;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_]["type"] == §_-S2I§.§_-m1v§)
            {
               if(_loc2_[_loc3_]["coins"] > 0)
               {
                  this.§_-72y§(new §_-3y§(Game.getPlayer(_loc2_[_loc3_]["player_id"]),_loc2_[_loc3_]["type"],_loc2_[_loc3_]["coins"],0,_loc2_[_loc3_]["data"],new Date(_loc2_[_loc3_]["time"] * 1000)));
               }
               if(_loc2_[_loc3_]["acorns"] > 0)
               {
                  this.§_-72y§(new §_-3y§(Game.getPlayer(_loc2_[_loc3_]["player_id"]),_loc2_[_loc3_]["type"],0,_loc2_[_loc3_]["acorns"],_loc2_[_loc3_]["data"],new Date(_loc2_[_loc3_]["time"] * 1000)));
               }
            }
            else
            {
               this.§_-72y§(new §_-3y§(Game.getPlayer(_loc2_[_loc3_]["player_id"]),_loc2_[_loc3_]["type"],_loc2_[_loc3_]["coins"],_loc2_[_loc3_]["acorns"],_loc2_[_loc3_]["data"],new Date(_loc2_[_loc3_]["time"] * 1000)));
            }
            _loc3_++;
         }
      }
      
      private function §_-j1J§() : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Rectangle = null;
         var _loc1_:String = "";
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = int(this.§_-oq§.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = 0;
            _loc6_ = int(this.§_-oR§.length);
            while(_loc5_ < _loc6_)
            {
               _loc2_ = this.§_-oq§[_loc3_].text.indexOf(this.§_-oR§[_loc5_]);
               if(_loc2_ > -1)
               {
                  _loc1_ = this.§_-oR§[_loc5_];
                  break;
               }
               _loc5_++;
            }
            if(!(_loc1_ == "" || _loc2_ < 0))
            {
               _loc7_ = this.§_-oq§[_loc3_].getCharBoundaries(_loc2_ - 2);
               if(!_loc7_)
               {
                  _loc7_ = new Rectangle();
               }
               _loc7_.y += this.§_-oq§[_loc3_].y;
               this.drawIcon(_loc1_ == §_-3y§.§_-f2V§,_loc7_);
               this.§_-oq§[_loc3_].htmlText = this.§_-oq§[_loc3_].htmlText.replace(_loc1_," ");
               _loc1_ = "";
            }
            _loc3_++;
         }
      }
      
      private function drawIcon(param1:Boolean, param2:Rectangle) : void
      {
         var _loc3_:BitmapData = param1 ? §_-51s§ : §_-e1j§;
         var _loc4_:Rectangle = new Rectangle(param2.x + 8,param2.y - (_loc3_.height - param2.height) * 0.5,_loc3_.width,_loc3_.height);
         this.graphics.beginBitmapFill(_loc3_,new Matrix(1,0,0,1,_loc4_.x + this.text.x,_loc4_.y + this.text.y),false);
         this.graphics.drawRect(_loc4_.x + this.text.x,_loc4_.y + this.text.y,_loc4_.width,_loc4_.height);
         this.graphics.endFill();
      }
      
      private function §_-73N§(param1:§_-dd§) : void
      {
         var _loc2_:TextField = new TextField();
         _loc2_.selectable = false;
         _loc2_.defaultTextFormat = new TextFormat(§_-22V§.§_-F2z§,11,0,false);
         _loc2_.embedFonts = true;
         _loc2_.antiAliasType = AntiAliasType.ADVANCED;
         _loc2_.gridFitType = GridFitType.PIXEL;
         _loc2_.thickness = 100;
         _loc2_.sharpness = 0;
         _loc2_.htmlText = this.§_-61l§((param1 as §_-3y§).date);
         _loc2_.width = _loc2_.textWidth + 5;
         _loc2_.height = _loc2_.textHeight + 5;
         var _loc3_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,16777215);
         _loc3_.draw(_loc2_);
         var _loc4_:§_-22V§ = §_-oq§[§_-oq§.length - 1];
         var _loc5_:int = _loc4_.x + _loc4_.width + (§_-m1c§ - _loc3_.width * 0.5) - §_-L1R§;
         var _loc6_:int = §_-i1m§ + _loc4_.y;
         this.graphics.beginBitmapFill(_loc3_,new Matrix(1,0,0,1,_loc5_,_loc6_),false,false);
         this.graphics.drawRect(_loc5_,_loc6_,_loc3_.width,_loc3_.height);
         this.graphics.endFill();
      }
      
      private function §_-61l§(param1:Date) : String
      {
         var _loc2_:Date = new Date();
         return this.§_-aH§(param1.hours) + ":" + this.§_-aH§(param1.minutes) + "  " + (_loc2_.month == param1.month && _loc2_.date == param1.date && _loc2_.fullYear == param1.fullYear ? "" : this.§_-aH§(param1.date) + "." + this.§_-aH§(param1.month + 1));
      }
      
      private function request() : void
      {
         if(this.§_-y2p§)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-Wz§);
         this.§_-y2p§ = true;
      }
      
      private function update(param1:ClanNoticeEvent) : void
      {
         if(!this.§_-y2p§)
         {
            return;
         }
         this.dispose();
         dispatchEvent(new Event("CHANGED"));
         this.request();
      }
      
      private function §_-o1P§(param1:MouseEvent) : void
      {
         var _loc2_:§_-22V§ = §_-22V§(param1.currentTarget);
         if(_loc2_.userData)
         {
            §_-927§.§_-i2I§(int(_loc2_.userData));
         }
      }
   }
}

