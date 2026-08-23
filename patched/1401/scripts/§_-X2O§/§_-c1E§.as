package §_-X2O§
{
   import §_-CF§.§_-G1v§;
   import §_-I10§.§_-ct§;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.Dialog;
   import §_-vK§.§_-QC§;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.AntiAliasType;
   import flash.text.StyleSheet;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.§_-x1Z§;
   import utils.§_-xb§;
   
   public class §_-c1E§ extends Dialog
   {
      
      private static const §_-52d§:int = 283;
      
      private static const §_-723§:int = 70;
      
      private static const §_-A3E§:int = 190;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #1B120E;","text-align: left;","}",".bold {","font-weight: bold;","text-align: center;","}",".red {","font-size: 10px;","color: #FF0000;","}",".description {","font-size: 14px;","color: #000000;","}",".number {","font-size: 14px;","color: #00997F;","font-weight: bold;","}"].join("\n");
      
      private var §_-82H§:MovieClip;
      
      private var background:MovieClip;
      
      private var §_-s1b§:Sprite;
      
      private var buttons:Sprite;
      
      private var buttonsArray:Array;
      
      private var §_-M2y§:Sprite;
      
      private var §_-V2v§:§_-22V§;
      
      private var §_-l2u§:§_-22V§;
      
      private var §_-nV§:§_-22V§;
      
      private var §_-e2e§:§_-22V§;
      
      private var §_-p2j§:Bitmap = null;
      
      private var §_-v2m§:Shape;
      
      private var §_-zK§:Shape;
      
      private var §_-Zn§:Array = null;
      
      private var style:StyleSheet;
      
      public var §_-S20§:§_-G1v§ = null;
      
      public function §_-c1E§()
      {
         var circle:Shape;
         var learningField:§_-22V§;
         var i:int;
         var progressBorder:Shape = null;
         super("",false,false);
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         this.background = new ShamanSkillDialogImage();
         this.background.crossButton.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            GameSounds.play(§_-43Z§.CLICK);
            hide();
         });
         addChild(this.background);
         this.§_-V2v§ = new §_-22V§("",132,33,new TextFormat(§_-22V§.§_-F2z§,22,8605727,true));
         addChild(this.§_-V2v§);
         this.§_-l2u§ = new §_-22V§("",132,56,new TextFormat(§_-22V§.§_-F2z§,12,8605727));
         addChild(this.§_-l2u§);
         this.§_-nV§ = new §_-22V§("",132,72,this.style);
         this.§_-nV§.width = 295;
         this.§_-nV§.multiline = true;
         this.§_-nV§.wordWrap = true;
         addChild(this.§_-nV§);
         circle = new Shape();
         circle.x = 8;
         circle.y = 38;
         circle.graphics.beginFill(15771990,0.45);
         circle.graphics.drawCircle(57,46,55);
         circle.graphics.endFill();
         addChild(circle);
         this.§_-M2y§ = new Sprite();
         this.§_-M2y§.x = 42;
         this.§_-M2y§.y = 128;
         this.§_-M2y§.graphics.beginFill(8605727);
         this.§_-M2y§.graphics.drawRoundRect(0,0,44,18,15);
         this.§_-M2y§.graphics.endFill();
         this.§_-M2y§.mouseEnabled = false;
         this.§_-M2y§.mouseChildren = false;
         addChild(this.§_-M2y§);
         this.§_-e2e§ = new §_-22V§("0/6",0,-2,new TextFormat(§_-22V§.§_-F2z§,16,16777215,true,null,null,null,null,TextFormatAlign.CENTER));
         this.§_-e2e§.width = 44;
         this.§_-e2e§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-e2e§.antiAliasType = AntiAliasType.NORMAL;
         this.§_-M2y§.addChild(this.§_-e2e§);
         place();
         this.width = 443;
         this.§_-s1b§ = new Sprite();
         this.§_-s1b§.x = 23;
         this.§_-s1b§.y = this.height - 115;
         addChild(this.§_-s1b§);
         this.§_-82H§ = new SkillLevelsBackground();
         this.§_-s1b§.addChild(this.§_-82H§);
         this.buttons = new Sprite();
         this.§_-s1b§.addChild(this.buttons);
         learningField = new §_-22V§(gls("Изучение навыка"),130,-24,new TextFormat(§_-22V§.§_-F2z§,16,7156992));
         this.§_-s1b§.addChild(learningField);
         this.§_-v2m§ = new Shape();
         this.§_-v2m§.graphics.beginFill(3394560);
         this.§_-v2m§.graphics.drawRect(0,0,§_-A3E§,3);
         this.§_-v2m§.x = 0;
         this.§_-v2m§.y = 84;
         this.§_-s1b§.addChild(this.§_-v2m§);
         this.§_-zK§ = new Shape();
         this.§_-zK§.graphics.beginFill(3394560);
         this.§_-zK§.graphics.drawRect(0,0,§_-A3E§,3);
         this.§_-zK§.x = 210;
         this.§_-zK§.y = 84;
         this.§_-s1b§.addChild(this.§_-zK§);
         i = 0;
         while(i < 2)
         {
            progressBorder = new Shape();
            progressBorder.graphics.lineStyle(1,16777215,1,true);
            progressBorder.graphics.beginFill(16777215,0);
            progressBorder.graphics.drawRoundRectComplex(0,0,§_-A3E§,3,2,2,2,2);
            progressBorder.graphics.endFill();
            progressBorder.x = i * 210;
            progressBorder.y = 84;
            this.§_-s1b§.addChild(progressBorder);
            i++;
         }
      }
      
      public function §_-v1t§(param1:§_-G1v§) : void
      {
         var _loc3_:Object = null;
         var _loc7_:Sprite = null;
         var _loc8_:Sprite = null;
         var _loc9_:SkillSunButton = null;
         var _loc10_:ImageIconFeather = null;
         var _loc11_:§_-22V§ = null;
         var _loc12_:ImageIconCoins = null;
         var _loc13_:BlockedSkillImage = null;
         var _loc14_:LockDetailImage = null;
         if(Boolean(this.§_-S20§) && this.§_-S20§.id == param1.id)
         {
            show();
            return;
         }
         this.§_-S20§ = param1;
         var _loc2_:Object = §_-QC§.perkData[this.§_-S20§["id"]];
         this.§_-V2v§.text = _loc2_["name"];
         this.§_-l2u§.text = _loc2_["active"] ? gls("активный") : gls("пассивный");
         this.§_-Zn§ = (_loc2_["gold_cost"] as Array).slice();
         if(this.§_-p2j§)
         {
            removeChild(this.§_-p2j§);
         }
         this.§_-p2j§ = new Bitmap(this.§_-S20§.§_-p2j§);
         this.§_-p2j§.x = 21;
         this.§_-p2j§.y = 38;
         addChild(this.§_-p2j§);
         while(this.buttons.numChildren > 0)
         {
            this.buttons.removeChildAt(0);
         }
         this.buttonsArray = [];
         var _loc4_:int = 10;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         while(_loc6_ < §_-ct§.§_-f1D§)
         {
            _loc3_ = {};
            _loc5_ = _loc6_ < 3;
            _loc3_["status_string"] = §_-QC§.§_-03v§(this.§_-S20§.id,§_-QC§.§_-42e§,[_loc5_ ? _loc6_ + 1 : 0,!_loc5_ ? _loc6_ - 2 : 0]);
            _loc7_ = new Sprite();
            _loc7_.addChild(new Bitmap(this.§_-S20§.§_-R0§));
            _loc7_.x = _loc4_;
            _loc7_.y = 15;
            this.buttons.addChild(_loc7_);
            _loc3_["image"] = _loc7_;
            _loc8_ = new Sprite();
            _loc8_.x = _loc7_.x;
            _loc8_.y = _loc7_.y + 45;
            _loc8_.visible = false;
            this.buttons.addChild(_loc8_);
            if(_loc5_)
            {
               _loc10_ = new ImageIconFeather();
               _loc10_.x = 10;
               _loc10_.scaleX = _loc10_.scaleY = 0.6;
               _loc8_.addChild(_loc10_);
            }
            else
            {
               _loc11_ = new §_-22V§(String(this.§_-Zn§[_loc6_ - 3]),0,0,new TextFormat(§_-22V§.§_-F2z§,14,7156992,true));
               _loc11_.x = 9 - _loc11_.width * 0.5;
               _loc8_.addChild(_loc11_);
               _loc12_ = new ImageIconCoins();
               _loc12_.x = _loc11_.x + _loc11_.width + 2;
               _loc12_.y = 2;
               _loc12_.scaleX = _loc12_.scaleY = 0.6;
               _loc8_.addChild(_loc12_);
            }
            _loc3_["image_status"] = new §_-Hb§(_loc3_["image"],_loc3_["status_string"]);
            _loc3_["image_status"].setStyle(this.style);
            _loc3_["image_status"].maxWidth = 200;
            _loc3_["cost"] = _loc8_;
            _loc9_ = new SkillSunButton();
            _loc9_.x = _loc7_.x;
            _loc9_.y = _loc7_.y;
            _loc9_.scaleX = _loc9_.scaleY = 0.8;
            _loc9_.visible = false;
            _loc9_.name = String(_loc6_);
            this.buttons.addChildAt(_loc9_,0);
            _loc3_["learn_button"] = _loc9_;
            new §_-Hb§(_loc3_["learn_button"],_loc3_["status_string"]);
            if(!_loc5_)
            {
               _loc13_ = new BlockedSkillImage();
               _loc13_.x = _loc7_.x;
               _loc13_.y = _loc7_.y;
               _loc13_.visible = false;
               _loc13_.mouseChildren = false;
               _loc13_.mouseEnabled = false;
               _loc13_.scaleX = _loc13_.scaleY = 0.8;
               this.buttons.addChild(_loc13_);
               _loc14_ = new LockDetailImage();
               _loc13_.addChild(_loc14_);
               _loc3_["blocked"] = _loc13_;
            }
            this.buttonsArray.push(_loc3_);
            _loc4_ += _loc6_ == 1 || _loc6_ == 4 ? 64 : (_loc6_ == 2 ? 78 : 68);
            _loc6_++;
         }
         this.§_-k§();
         show();
      }
      
      public function §_-k§() : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:String = null;
         var _loc1_:int = §_-ct§.§_-w2d§(this.§_-S20§.§_-w1W§,this.§_-S20§.§_-D24§);
         this.§_-nV§.htmlText = §_-xb§.tag("body") + §_-xb§.span(§_-QC§.§_-k19§(this.§_-S20§.id,[this.§_-S20§.§_-w1W§,_loc1_]),"description") + §_-xb§.§_-p1§("body");
         this.§_-e2e§.text = String(this.§_-S20§.§_-w1W§ + this.§_-S20§.§_-D24§) + "/" + String(§_-ct§.§_-f1D§);
         var _loc2_:int = this.x;
         var _loc3_:int = this.y;
         this.height = §_-52d§ + (this.§_-nV§.height > §_-723§ ? this.§_-nV§.height - §_-723§ : 0);
         this.background.height = this.height;
         this.x = _loc2_;
         this.y = _loc3_;
         this.§_-s1b§.y = this.height - 115;
         this.§_-v2m§.width = this.§_-S20§.§_-w1W§ * §_-A3E§ / 3;
         this.§_-zK§.width = _loc1_ * §_-A3E§ / 3;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         while(_loc5_ < §_-ct§.§_-f1D§)
         {
            _loc4_ = _loc5_ < 3;
            if(!_loc4_)
            {
               this.buttonsArray[_loc5_]["blocked"].visible = false;
            }
            this.buttonsArray[_loc5_]["image_status"].setStatus(§_-xb§.tag("body") + this.buttonsArray[_loc5_]["status_string"] + §_-xb§.§_-p1§("body"));
            if(_loc4_ && _loc5_ >= this.§_-S20§.§_-w1W§ || !_loc4_ && _loc5_ - 3 >= this.§_-S20§.§_-D24§)
            {
               this.buttonsArray[_loc5_]["image"].filters = §_-x1Z§.§_-c2G§;
               this.§_-82H§["item" + String(_loc5_)].filters = §_-x1Z§.§_-c2G§;
               _loc6_ = false;
               if(!this.§_-S20§.blocked)
               {
                  if(_loc4_ && _loc5_ == this.§_-S20§.§_-w1W§ && §_-ct§.§_-c1x§(§_-ct§.§_-m1k§) > 0)
                  {
                     _loc6_ = true;
                  }
                  else if(!_loc4_ && _loc5_ - 3 == this.§_-S20§.§_-D24§ && _loc5_ - 3 == _loc1_)
                  {
                     if(_loc5_ == 4)
                     {
                        _loc6_ = true;
                     }
                     else if(_loc5_ - 3 < this.§_-S20§.§_-w1W§)
                     {
                        _loc6_ = true;
                     }
                  }
               }
               this.buttonsArray[_loc5_]["image"].mouseChildren = !_loc6_;
               this.buttonsArray[_loc5_]["image"].mouseEnabled = !_loc6_;
               if(_loc6_)
               {
                  this.buttonsArray[_loc5_]["learn_button"].visible = true;
                  this.buttonsArray[_loc5_]["learn_button"].addEventListener(MouseEvent.CLICK,this.§_-Z2D§);
                  this.buttonsArray[_loc5_]["learn_button"].addEventListener(MouseEvent.MOUSE_OVER,this.§_-Q20§);
                  this.buttonsArray[_loc5_]["learn_button"].addEventListener(MouseEvent.MOUSE_OUT,this.§_-9c§);
                  this.buttonsArray[_loc5_]["cost"].visible = true;
                  this.buttonsArray[_loc5_]["cost"].filters = null;
               }
               else
               {
                  this.buttonsArray[_loc5_]["learn_button"].visible = false;
                  this.buttonsArray[_loc5_]["cost"].visible = true;
                  this.buttonsArray[_loc5_]["cost"].filters = §_-x1Z§.§_-c2G§;
                  _loc7_ = §_-xb§.tag("body") + this.buttonsArray[_loc5_]["status_string"];
                  if(this.§_-S20§.blocked)
                  {
                     _loc7_ += this.§_-S20§.§_-A2W§;
                  }
                  else if(_loc4_ && _loc5_ == this.§_-S20§.§_-w1W§ && §_-ct§.§_-c1x§(§_-ct§.§_-m1k§) == 0)
                  {
                     _loc7_ += "<br /><br />" + §_-xb§.span(gls("Недостаточно перьев для изучения навыка."),"red");
                  }
                  else
                  {
                     _loc7_ += "<br /><br />" + §_-xb§.span(this.§_-Z15§(_loc5_),"red");
                  }
                  _loc7_ += §_-xb§.§_-p1§("body");
                  this.buttonsArray[_loc5_]["image_status"].setStatus(_loc7_);
               }
            }
            else
            {
               this.buttonsArray[_loc5_]["learn_button"].visible = false;
               this.buttonsArray[_loc5_]["learn_button"].removeEventListener(MouseEvent.CLICK,this.§_-Z2D§);
               this.buttonsArray[_loc5_]["learn_button"].removeEventListener(MouseEvent.MOUSE_OVER,this.§_-Q20§);
               this.buttonsArray[_loc5_]["learn_button"].removeEventListener(MouseEvent.MOUSE_OUT,this.§_-9c§);
               this.buttonsArray[_loc5_]["image"].mouseChildren = true;
               this.buttonsArray[_loc5_]["image"].mouseEnabled = true;
               this.buttonsArray[_loc5_]["cost"].visible = false;
               this.§_-82H§["item" + String(_loc5_)].filters = null;
               this.buttonsArray[_loc5_]["image"].filters = null;
               if(!_loc4_ && _loc5_ - 3 >= _loc1_)
               {
                  this.buttonsArray[_loc5_]["blocked"].visible = true;
                  this.buttonsArray[_loc5_]["image_status"].setStatus(§_-xb§.tag("body") + this.buttonsArray[_loc5_]["status_string"] + "<br /><br />" + §_-xb§.span(this.§_-Z15§(_loc5_),"red") + §_-xb§.§_-p1§("body"));
               }
            }
            _loc5_++;
         }
      }
      
      private function §_-Z2D§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.CLICK);
         var _loc2_:int = int(param1.target.name);
         §_-ct§.§_-Z2D§(this.§_-S20§.id,_loc2_,_loc2_ >= 3 ? int(this.§_-Zn§[_loc2_ - 3]) : 0);
      }
      
      private function §_-Q20§(param1:MouseEvent) : void
      {
         var _loc2_:int = int(param1.target.name);
         this.buttonsArray[_loc2_]["image"].filters = null;
      }
      
      private function §_-9c§(param1:MouseEvent) : void
      {
         var _loc2_:int = int(param1.target.name);
         this.buttonsArray[_loc2_]["image"].filters = §_-x1Z§.§_-c2G§;
      }
      
      private function §_-Z15§(param1:int) : String
      {
         switch(param1)
         {
            case 1:
            case 3:
               return gls("Необходимо изучить 1-й уровень навыка.");
            case 2:
               return gls("Необходимо изучить 2-й уровень навыка.");
            case 4:
               return gls("Необходимо изучить 4-й уровень навыка.");
            case 5:
               return gls("Необходимо изучить все предыдущие уровни навыка.");
            default:
               return "";
         }
      }
   }
}

