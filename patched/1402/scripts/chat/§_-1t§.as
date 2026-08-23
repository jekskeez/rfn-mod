package chat
{
   import §_-U19§.§_-B2U§;
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
   import menu.§_-cD§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-1t§ extends §_-E1S§
   {
      
      private static const §_-C2f§:int = 0;
      
      private static const §_-2x§:int = 80;
      
      private static const §_-43W§:int = 28;
      
      private static const §_-Rs§:Number = 13.75;
      
      private static const §_-L1K§:int = 100;
      
      private static var §_-52V§:BitmapData = null;
      
      private static var §_-01E§:BitmapData = null;
      
      private static const §_-aD§:String = [".playerName {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #000000;","font-weight: bold;","}",".leaderName {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #000000;","font-weight: bold;","}",".subLeaderName {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #000000;","font-weight: bold;","}",".message {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #000000;","}","a {","text-decoration: underline;","}","","a:hover {","text-decoration: none;","}"].join("\n");
      
      private var §_-Z1B§:int = 0;
      
      private var §_-W2C§:Boolean = false;
      
      private var §_-B3X§:Array = [§_-52l§.§_-K2r§,§_-52l§.§_-d1i§];
      
      public function §_-1t§()
      {
         super();
         style = new StyleSheet();
         style.parseCSS(§_-aD§);
         §_-B2U§.listen(this.update,ClanNoticeEvent.CLAN_TRANSACTIONS_UPDATE);
      }
      
      public static function get §_-f1f§() : BitmapData
      {
         var _loc1_:ImageIconNut = null;
         var _loc2_:Sprite = null;
         if(!§_-52V§)
         {
            _loc1_ = new ImageIconNut();
            _loc1_.height = 16;
            _loc1_.scaleX = _loc1_.scaleY;
            _loc2_ = new Sprite();
            _loc2_.addChild(_loc1_);
            §_-52V§ = new BitmapData(_loc2_.width,_loc2_.height,true,16777215);
            §_-52V§.draw(_loc2_);
         }
         return §_-52V§;
      }
      
      public static function get §_-B2r§() : BitmapData
      {
         var _loc1_:ImageIconCoins = null;
         var _loc2_:Sprite = null;
         if(!§_-01E§)
         {
            _loc1_ = new ImageIconCoins();
            _loc1_.height = 16;
            _loc1_.scaleX = _loc1_.scaleY;
            _loc2_ = new Sprite();
            _loc2_.addChild(_loc1_);
            §_-01E§ = new BitmapData(_loc2_.width,_loc2_.height,true,16777215);
            §_-01E§.draw(_loc2_);
         }
         return §_-01E§;
      }
      
      override public function §_-pH§(param1:int) : void
      {
         super.§_-pH§(param1 - §_-2x§);
      }
      
      override public function sendMessage(param1:String) : void
      {
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-W2C§ = false;
      }
      
      override public function §_-9x§() : void
      {
         super.§_-9x§();
         this.§_-Z1B§ = 0;
         this.graphics.clear();
      }
      
      override public function §_-O1s§() : void
      {
         super.§_-O1s§();
         this.request();
      }
      
      override protected function listen() : void
      {
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-pb§]);
      }
      
      override protected function §_-K1D§(param1:§_-e28§) : void
      {
         var _loc2_:§_-i5§ = new §_-i5§("",0,0,style);
         _loc2_.htmlText = "<textformat leading=\"1\">" + param1.text + "</textformat><BR>";
         _loc2_.width = §_-6z§;
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         _loc2_.embedFonts = true;
         _loc2_.userData = param1.userId;
         _loc2_.antiAliasType = AntiAliasType.ADVANCED;
         _loc2_.gridFitType = GridFitType.PIXEL;
         _loc2_.thickness = 100;
         _loc2_.sharpness = 0;
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-QQ§);
         _loc2_.y = §_-U2P§.length ? §_-U2P§[§_-U2P§.length - 1].y + §_-U2P§[§_-U2P§.length - 1].height : 0;
         if(§_-U2P§.length == 0)
         {
            _loc2_.y += §_-Rs§;
         }
         §_-U2P§.push(_loc2_);
         this.§_-f16§(param1);
         this.§_-gt§();
         this.addChild(_loc2_);
      }
      
      protected function §_-N2n§(param1:int, param2:int = 2, param3:String = "0") : String
      {
         var _loc4_:String = String(param1);
         while(_loc4_.length < param2)
         {
            _loc4_ = param3 + _loc4_;
         }
         return _loc4_;
      }
      
      override protected function §_-93U§() : void
      {
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(!this.§_-W2C§)
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
         var _loc4_:int = Math.max(0,_loc2_.length - §_-L1K§);
         _loc3_ = _loc4_;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_]["type"] == §_-s2l§.§_-u2L§)
            {
               if(_loc2_[_loc3_]["coins"] > 0)
               {
                  this.§_-GH§(new §_-52l§(Game.getPlayer(_loc2_[_loc3_]["player_id"]),_loc2_[_loc3_]["type"],_loc2_[_loc3_]["coins"],0,_loc2_[_loc3_]["data"],new Date(_loc2_[_loc3_]["time"] * 1000)));
               }
               if(_loc2_[_loc3_]["acorns"] > 0)
               {
                  this.§_-GH§(new §_-52l§(Game.getPlayer(_loc2_[_loc3_]["player_id"]),_loc2_[_loc3_]["type"],0,_loc2_[_loc3_]["acorns"],_loc2_[_loc3_]["data"],new Date(_loc2_[_loc3_]["time"] * 1000)));
               }
            }
            else
            {
               this.§_-GH§(new §_-52l§(Game.getPlayer(_loc2_[_loc3_]["player_id"]),_loc2_[_loc3_]["type"],_loc2_[_loc3_]["coins"],_loc2_[_loc3_]["acorns"],_loc2_[_loc3_]["data"],new Date(_loc2_[_loc3_]["time"] * 1000)));
            }
            _loc3_++;
         }
      }
      
      private function §_-gt§() : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Rectangle = null;
         var _loc1_:String = "";
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = int(this.§_-U2P§.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = 0;
            _loc6_ = int(this.§_-B3X§.length);
            while(_loc5_ < _loc6_)
            {
               _loc2_ = this.§_-U2P§[_loc3_].text.indexOf(this.§_-B3X§[_loc5_]);
               if(_loc2_ > -1)
               {
                  _loc1_ = this.§_-B3X§[_loc5_];
                  break;
               }
               _loc5_++;
            }
            if(!(_loc1_ == "" || _loc2_ < 0))
            {
               _loc7_ = this.§_-U2P§[_loc3_].getCharBoundaries(_loc2_ - 2);
               if(!_loc7_)
               {
                  _loc7_ = new Rectangle();
               }
               _loc7_.y += this.§_-U2P§[_loc3_].y;
               this.drawIcon(_loc1_ == §_-52l§.§_-K2r§,_loc7_);
               this.§_-U2P§[_loc3_].htmlText = this.§_-U2P§[_loc3_].htmlText.replace(_loc1_," ");
               _loc1_ = "";
            }
            _loc3_++;
         }
      }
      
      private function drawIcon(param1:Boolean, param2:Rectangle) : void
      {
         var _loc3_:BitmapData = param1 ? §_-f1f§ : §_-B2r§;
         var _loc4_:Rectangle = new Rectangle(param2.x + 8,param2.y - (_loc3_.height - param2.height) * 0.5,_loc3_.width,_loc3_.height);
         this.graphics.beginBitmapFill(_loc3_,new Matrix(1,0,0,1,_loc4_.x + this.text.x,_loc4_.y + this.text.y),false);
         this.graphics.drawRect(_loc4_.x + this.text.x,_loc4_.y + this.text.y,_loc4_.width,_loc4_.height);
         this.graphics.endFill();
      }
      
      private function §_-f16§(param1:§_-e28§) : void
      {
         var _loc2_:TextField = new TextField();
         _loc2_.selectable = false;
         _loc2_.defaultTextFormat = new TextFormat(§_-i5§.§_-c10§,11,0,false);
         _loc2_.embedFonts = true;
         _loc2_.antiAliasType = AntiAliasType.ADVANCED;
         _loc2_.gridFitType = GridFitType.PIXEL;
         _loc2_.thickness = 100;
         _loc2_.sharpness = 0;
         _loc2_.htmlText = this.§_-13m§((param1 as §_-52l§).date);
         _loc2_.width = _loc2_.textWidth + 5;
         _loc2_.height = _loc2_.textHeight + 5;
         var _loc3_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,16777215);
         _loc3_.draw(_loc2_);
         var _loc4_:§_-i5§ = §_-U2P§[§_-U2P§.length - 1];
         var _loc5_:int = _loc4_.x + _loc4_.width + (§_-2x§ - _loc3_.width * 0.5) - §_-43W§;
         var _loc6_:int = §_-C2f§ + _loc4_.y;
         this.graphics.beginBitmapFill(_loc3_,new Matrix(1,0,0,1,_loc5_,_loc6_),false,false);
         this.graphics.drawRect(_loc5_,_loc6_,_loc3_.width,_loc3_.height);
         this.graphics.endFill();
      }
      
      private function §_-13m§(param1:Date) : String
      {
         var _loc2_:Date = new Date();
         return this.§_-N2n§(param1.hours) + ":" + this.§_-N2n§(param1.minutes) + "  " + (_loc2_.month == param1.month && _loc2_.date == param1.date && _loc2_.fullYear == param1.fullYear ? "" : this.§_-N2n§(param1.date) + "." + this.§_-N2n§(param1.month + 1));
      }
      
      private function request() : void
      {
         if(this.§_-W2C§)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-91i§);
         this.§_-W2C§ = true;
      }
      
      private function update(param1:ClanNoticeEvent) : void
      {
         if(!this.§_-W2C§)
         {
            return;
         }
         this.dispose();
         dispatchEvent(new Event("CHANGED"));
         this.request();
      }
      
      private function §_-QQ§(param1:MouseEvent) : void
      {
         var _loc2_:§_-i5§ = §_-i5§(param1.currentTarget);
         if(_loc2_.userData)
         {
            §_-cD§.§_-e25§(int(_loc2_.userData));
         }
      }
   }
}

