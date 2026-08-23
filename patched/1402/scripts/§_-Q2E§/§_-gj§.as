package §_-Q2E§
{
   import §_-S1n§.§_-kr§;
   import §_-S1w§.§_-O2N§;
   import §_-X1k§.§_-4v§;
   import §_-bN§.Dialog;
   import §_-o10§.§_-pl§;
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
   import sounds.§_-RH§;
   import utils.§_-r1G§;
   import utils.§_-y1l§;
   
   public class §_-gj§ extends Dialog
   {
      
      private static const §_-D2R§:int = 283;
      
      private static const §_-sf§:int = 70;
      
      private static const §_-5l§:int = 190;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #1B120E;","text-align: left;","}",".bold {","font-weight: bold;","text-align: center;","}",".red {","font-size: 10px;","color: #FF0000;","}",".description {","font-size: 14px;","color: #000000;","}",".number {","font-size: 14px;","color: #00997F;","font-weight: bold;","}"].join("\n");
      
      private var §_-g2§:MovieClip;
      
      private var background:MovieClip;
      
      private var §_-k2w§:Sprite;
      
      private var buttons:Sprite;
      
      private var buttonsArray:Array;
      
      private var §_-21J§:Sprite;
      
      private var §_-EC§:§_-i5§;
      
      private var §_-C35§:§_-i5§;
      
      private var §_-RN§:§_-i5§;
      
      private var §_-72y§:§_-i5§;
      
      private var §_-u1a§:Bitmap = null;
      
      private var §_-G2Z§:Shape;
      
      private var §_-l2d§:Shape;
      
      private var §_-tF§:Array = null;
      
      private var style:StyleSheet;
      
      public var §_-f2G§:§_-O2N§ = null;
      
      public function §_-gj§()
      {
         var circle:Shape;
         var learningField:§_-i5§;
         var i:int;
         var progressBorder:Shape = null;
         super("",false,false);
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
         this.background = new ShamanSkillDialogImage();
         this.background.crossButton.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            GameSounds.play(§_-RH§.CLICK);
            hide();
         });
         addChild(this.background);
         this.§_-EC§ = new §_-i5§("",132,33,new TextFormat(§_-i5§.§_-c10§,22,8605727,true));
         addChild(this.§_-EC§);
         this.§_-C35§ = new §_-i5§("",132,56,new TextFormat(§_-i5§.§_-c10§,12,8605727));
         addChild(this.§_-C35§);
         this.§_-RN§ = new §_-i5§("",132,72,this.style);
         this.§_-RN§.width = 295;
         this.§_-RN§.multiline = true;
         this.§_-RN§.wordWrap = true;
         addChild(this.§_-RN§);
         circle = new Shape();
         circle.x = 8;
         circle.y = 38;
         circle.graphics.beginFill(15771990,0.45);
         circle.graphics.drawCircle(57,46,55);
         circle.graphics.endFill();
         addChild(circle);
         this.§_-21J§ = new Sprite();
         this.§_-21J§.x = 42;
         this.§_-21J§.y = 128;
         this.§_-21J§.graphics.beginFill(8605727);
         this.§_-21J§.graphics.drawRoundRect(0,0,44,18,15);
         this.§_-21J§.graphics.endFill();
         this.§_-21J§.mouseEnabled = false;
         this.§_-21J§.mouseChildren = false;
         addChild(this.§_-21J§);
         this.§_-72y§ = new §_-i5§("0/6",0,-2,new TextFormat(§_-i5§.§_-c10§,16,16777215,true,null,null,null,null,TextFormatAlign.CENTER));
         this.§_-72y§.width = 44;
         this.§_-72y§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-72y§.antiAliasType = AntiAliasType.NORMAL;
         this.§_-21J§.addChild(this.§_-72y§);
         place();
         this.width = 443;
         this.§_-k2w§ = new Sprite();
         this.§_-k2w§.x = 23;
         this.§_-k2w§.y = this.height - 115;
         addChild(this.§_-k2w§);
         this.§_-g2§ = new SkillLevelsBackground();
         this.§_-k2w§.addChild(this.§_-g2§);
         this.buttons = new Sprite();
         this.§_-k2w§.addChild(this.buttons);
         learningField = new §_-i5§(gls("Изучение навыка"),130,-24,new TextFormat(§_-i5§.§_-c10§,16,7156992));
         this.§_-k2w§.addChild(learningField);
         this.§_-G2Z§ = new Shape();
         this.§_-G2Z§.graphics.beginFill(3394560);
         this.§_-G2Z§.graphics.drawRect(0,0,§_-5l§,3);
         this.§_-G2Z§.x = 0;
         this.§_-G2Z§.y = 84;
         this.§_-k2w§.addChild(this.§_-G2Z§);
         this.§_-l2d§ = new Shape();
         this.§_-l2d§.graphics.beginFill(3394560);
         this.§_-l2d§.graphics.drawRect(0,0,§_-5l§,3);
         this.§_-l2d§.x = 210;
         this.§_-l2d§.y = 84;
         this.§_-k2w§.addChild(this.§_-l2d§);
         i = 0;
         while(i < 2)
         {
            progressBorder = new Shape();
            progressBorder.graphics.lineStyle(1,16777215,1,true);
            progressBorder.graphics.beginFill(16777215,0);
            progressBorder.graphics.drawRoundRectComplex(0,0,§_-5l§,3,2,2,2,2);
            progressBorder.graphics.endFill();
            progressBorder.x = i * 210;
            progressBorder.y = 84;
            this.§_-k2w§.addChild(progressBorder);
            i++;
         }
      }
      
      public function §_-E2I§(param1:§_-O2N§) : void
      {
         var _loc3_:Object = null;
         var _loc7_:Sprite = null;
         var _loc8_:Sprite = null;
         var _loc9_:SkillSunButton = null;
         var _loc10_:ImageIconFeather = null;
         var _loc11_:§_-i5§ = null;
         var _loc12_:ImageIconCoins = null;
         var _loc13_:BlockedSkillImage = null;
         var _loc14_:LockDetailImage = null;
         if(Boolean(this.§_-f2G§) && this.§_-f2G§.id == param1.id)
         {
            show();
            return;
         }
         this.§_-f2G§ = param1;
         var _loc2_:Object = §_-pl§.perkData[this.§_-f2G§["id"]];
         this.§_-EC§.text = _loc2_["name"];
         this.§_-C35§.text = _loc2_["active"] ? gls("активный") : gls("пассивный");
         this.§_-tF§ = (_loc2_["gold_cost"] as Array).slice();
         if(this.§_-u1a§)
         {
            removeChild(this.§_-u1a§);
         }
         this.§_-u1a§ = new Bitmap(this.§_-f2G§.§_-u1a§);
         this.§_-u1a§.x = 21;
         this.§_-u1a§.y = 38;
         addChild(this.§_-u1a§);
         while(this.buttons.numChildren > 0)
         {
            this.buttons.removeChildAt(0);
         }
         this.buttonsArray = [];
         var _loc4_:int = 10;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         while(_loc6_ < §_-4v§.§_-v1K§)
         {
            _loc3_ = {};
            _loc5_ = _loc6_ < 3;
            _loc3_["status_string"] = §_-pl§.§_-O2e§(this.§_-f2G§.id,§_-pl§.§_-L7§,[_loc5_ ? _loc6_ + 1 : 0,!_loc5_ ? _loc6_ - 2 : 0]);
            _loc7_ = new Sprite();
            _loc7_.addChild(new Bitmap(this.§_-f2G§.§_-M2e§));
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
               _loc11_ = new §_-i5§(String(this.§_-tF§[_loc6_ - 3]),0,0,new TextFormat(§_-i5§.§_-c10§,14,7156992,true));
               _loc11_.x = 9 - _loc11_.width * 0.5;
               _loc8_.addChild(_loc11_);
               _loc12_ = new ImageIconCoins();
               _loc12_.x = _loc11_.x + _loc11_.width + 2;
               _loc12_.y = 2;
               _loc12_.scaleX = _loc12_.scaleY = 0.6;
               _loc8_.addChild(_loc12_);
            }
            _loc3_["image_status"] = new §_-kr§(_loc3_["image"],_loc3_["status_string"]);
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
            new §_-kr§(_loc3_["learn_button"],_loc3_["status_string"]);
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
         this.§_-k1M§();
         show();
      }
      
      public function §_-k1M§() : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:String = null;
         var _loc1_:int = §_-4v§.§_-R2G§(this.§_-f2G§.§_-43U§,this.§_-f2G§.§_-X2I§);
         this.§_-RN§.htmlText = §_-r1G§.tag("body") + §_-r1G§.span(§_-pl§.§_-u2m§(this.§_-f2G§.id,[this.§_-f2G§.§_-43U§,_loc1_]),"description") + §_-r1G§.§_-43A§("body");
         this.§_-72y§.text = String(this.§_-f2G§.§_-43U§ + this.§_-f2G§.§_-X2I§) + "/" + String(§_-4v§.§_-v1K§);
         var _loc2_:int = this.x;
         var _loc3_:int = this.y;
         this.height = §_-D2R§ + (this.§_-RN§.height > §_-sf§ ? this.§_-RN§.height - §_-sf§ : 0);
         this.background.height = this.height;
         this.x = _loc2_;
         this.y = _loc3_;
         this.§_-k2w§.y = this.height - 115;
         this.§_-G2Z§.width = this.§_-f2G§.§_-43U§ * §_-5l§ / 3;
         this.§_-l2d§.width = _loc1_ * §_-5l§ / 3;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         while(_loc5_ < §_-4v§.§_-v1K§)
         {
            _loc4_ = _loc5_ < 3;
            if(!_loc4_)
            {
               this.buttonsArray[_loc5_]["blocked"].visible = false;
            }
            this.buttonsArray[_loc5_]["image_status"].setStatus(§_-r1G§.tag("body") + this.buttonsArray[_loc5_]["status_string"] + §_-r1G§.§_-43A§("body"));
            if(_loc4_ && _loc5_ >= this.§_-f2G§.§_-43U§ || !_loc4_ && _loc5_ - 3 >= this.§_-f2G§.§_-X2I§)
            {
               this.buttonsArray[_loc5_]["image"].filters = §_-y1l§.§_-Tk§;
               this.§_-g2§["item" + String(_loc5_)].filters = §_-y1l§.§_-Tk§;
               _loc6_ = false;
               if(!this.§_-f2G§.blocked)
               {
                  if(_loc4_ && _loc5_ == this.§_-f2G§.§_-43U§ && §_-4v§.§_-A3U§(§_-4v§.§_-71M§) > 0)
                  {
                     _loc6_ = true;
                  }
                  else if(!_loc4_ && _loc5_ - 3 == this.§_-f2G§.§_-X2I§ && _loc5_ - 3 == _loc1_)
                  {
                     if(_loc5_ == 4)
                     {
                        _loc6_ = true;
                     }
                     else if(_loc5_ - 3 < this.§_-f2G§.§_-43U§)
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
                  this.buttonsArray[_loc5_]["learn_button"].addEventListener(MouseEvent.CLICK,this.§_-WI§);
                  this.buttonsArray[_loc5_]["learn_button"].addEventListener(MouseEvent.MOUSE_OVER,this.§_-T2H§);
                  this.buttonsArray[_loc5_]["learn_button"].addEventListener(MouseEvent.MOUSE_OUT,this.§_-k2s§);
                  this.buttonsArray[_loc5_]["cost"].visible = true;
                  this.buttonsArray[_loc5_]["cost"].filters = null;
               }
               else
               {
                  this.buttonsArray[_loc5_]["learn_button"].visible = false;
                  this.buttonsArray[_loc5_]["cost"].visible = true;
                  this.buttonsArray[_loc5_]["cost"].filters = §_-y1l§.§_-Tk§;
                  _loc7_ = §_-r1G§.tag("body") + this.buttonsArray[_loc5_]["status_string"];
                  if(this.§_-f2G§.blocked)
                  {
                     _loc7_ += this.§_-f2G§.§_-92U§;
                  }
                  else if(_loc4_ && _loc5_ == this.§_-f2G§.§_-43U§ && §_-4v§.§_-A3U§(§_-4v§.§_-71M§) == 0)
                  {
                     _loc7_ += "<br /><br />" + §_-r1G§.span(gls("Недостаточно перьев для изучения навыка."),"red");
                  }
                  else
                  {
                     _loc7_ += "<br /><br />" + §_-r1G§.span(this.§_-R2x§(_loc5_),"red");
                  }
                  _loc7_ += §_-r1G§.§_-43A§("body");
                  this.buttonsArray[_loc5_]["image_status"].setStatus(_loc7_);
               }
            }
            else
            {
               this.buttonsArray[_loc5_]["learn_button"].visible = false;
               this.buttonsArray[_loc5_]["learn_button"].removeEventListener(MouseEvent.CLICK,this.§_-WI§);
               this.buttonsArray[_loc5_]["learn_button"].removeEventListener(MouseEvent.MOUSE_OVER,this.§_-T2H§);
               this.buttonsArray[_loc5_]["learn_button"].removeEventListener(MouseEvent.MOUSE_OUT,this.§_-k2s§);
               this.buttonsArray[_loc5_]["image"].mouseChildren = true;
               this.buttonsArray[_loc5_]["image"].mouseEnabled = true;
               this.buttonsArray[_loc5_]["cost"].visible = false;
               this.§_-g2§["item" + String(_loc5_)].filters = null;
               this.buttonsArray[_loc5_]["image"].filters = null;
               if(!_loc4_ && _loc5_ - 3 >= _loc1_)
               {
                  this.buttonsArray[_loc5_]["blocked"].visible = true;
                  this.buttonsArray[_loc5_]["image_status"].setStatus(§_-r1G§.tag("body") + this.buttonsArray[_loc5_]["status_string"] + "<br /><br />" + §_-r1G§.span(this.§_-R2x§(_loc5_),"red") + §_-r1G§.§_-43A§("body"));
               }
            }
            _loc5_++;
         }
      }
      
      private function §_-WI§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.CLICK);
         var _loc2_:int = int(param1.target.name);
         §_-4v§.§_-WI§(this.§_-f2G§.id,_loc2_,_loc2_ >= 3 ? int(this.§_-tF§[_loc2_ - 3]) : 0);
      }
      
      private function §_-T2H§(param1:MouseEvent) : void
      {
         var _loc2_:int = int(param1.target.name);
         this.buttonsArray[_loc2_]["image"].filters = null;
      }
      
      private function §_-k2s§(param1:MouseEvent) : void
      {
         var _loc2_:int = int(param1.target.name);
         this.buttonsArray[_loc2_]["image"].filters = §_-y1l§.§_-Tk§;
      }
      
      private function §_-R2x§(param1:int) : String
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

