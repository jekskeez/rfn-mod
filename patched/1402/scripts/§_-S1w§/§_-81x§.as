package §_-S1w§
{
   import §_-22D§.TweenMax;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-4v§;
   import §_-bN§.Dialog;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.§_-r1G§;
   
   public class §_-81x§ extends Sprite
   {
      
      private static const §_-ew§:int = 52;
      
      private static const §_-32W§:int = 43;
      
      private static const §_-A3C§:int = 67;
      
      private static const §_-q2o§:int = 65;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #1B120E;","text-align: left;","}",".bold {","font-weight: bold;","text-align: center;","}"].join("\n");
      
      public static const §_-m2n§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,21,16763904,null,null,null,null,null,"center");
      
      public static const §_-Jd§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,19,8812372,null,null,null,null,null,"right");
      
      private var skills:Vector.<§_-O2N§>;
      
      private var blocked:Boolean = true;
      
      private var §_-c1i§:int;
      
      private var §_-e2R§:§_-i5§;
      
      private var §_-C3g§:§_-i5§;
      
      private var §_-R2O§:int = 0;
      
      private var §_-9V§:SimpleButton = null;
      
      private var §_-e1f§:SimpleButton = null;
      
      private var style:StyleSheet;
      
      private var §_-Y1m§:DisplayObject = null;
      
      private var blockImage:DisplayObjectContainer = null;
      
      public function §_-81x§(param1:int, param2:Array)
      {
         var _loc10_:§_-O2N§ = null;
         super();
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
         this.§_-c1i§ = param1;
         this.§_-Y1m§ = new ActiveBranchImage();
         addChild(this.§_-Y1m§);
         this.skills = new Vector.<§_-O2N§>();
         var _loc3_:int = §_-ew§ + §_-A3C§;
         var _loc4_:int = §_-32W§;
         var _loc5_:int = 0;
         while(_loc5_ < param2.length)
         {
            if(_loc5_ == param2.length - 1)
            {
               _loc3_ = §_-ew§ + §_-A3C§;
            }
            _loc10_ = new §_-O2N§(param2[_loc5_],_loc5_,this.§_-c1i§);
            _loc10_.x = _loc3_;
            _loc10_.y = _loc4_;
            addChild(_loc10_);
            this.skills.push(_loc10_);
            if(_loc5_ == 0)
            {
               _loc3_ = §_-ew§;
               _loc4_ += §_-q2o§;
            }
            else
            {
               _loc3_ += §_-A3C§;
               if(_loc3_ == §_-ew§ + 3 * §_-A3C§)
               {
                  _loc3_ = §_-ew§;
                  _loc4_ += §_-q2o§;
               }
            }
            _loc5_++;
         }
         this.§_-e2R§ = new §_-i5§(§_-4v§.§_-za§[this.§_-c1i§],40,0,§_-m2n§);
         this.§_-e2R§.filters = Dialog.§_-q2I§;
         this.§_-e2R§.width = 200;
         this.§_-e2R§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-e2R§);
         var _loc6_:§_-kr§ = new §_-kr§(this.§_-e2R§,"");
         _loc6_.setStyle(this.style);
         _loc6_.maxWidth = 220;
         _loc6_.setStatus(§_-4v§.§_-R2u§(this.§_-c1i§));
         var _loc7_:Sprite = new Sprite();
         addChild(_loc7_);
         this.§_-C3g§ = new §_-i5§(String(§_-4v§.§_-12z§),155,0,§_-Jd§);
         this.§_-C3g§.autoSize = TextFieldAutoSize.RIGHT;
         _loc7_.addChild(this.§_-C3g§);
         var _loc8_:ImageIconFeather = new ImageIconFeather();
         _loc8_.x = 255;
         _loc8_.y = this.§_-C3g§.y + 1;
         _loc7_.addChild(_loc8_);
         var _loc9_:§_-kr§ = new §_-kr§(_loc7_,"");
         _loc9_.setStyle(this.style);
         _loc9_.maxWidth = 290;
         _loc9_.setStatus(§_-r1G§.tag("body") + §_-r1G§.span(gls("Перья"),"bold") + gls("<br />Шаман получает одно перо за каждый новый уровень<br/>Перья используются для изучения навыков шамана") + §_-r1G§.§_-43A§("body"));
      }
      
      public function §_-33r§() : void
      {
         this.§_-C3g§.text = String(§_-4v§.§_-A3U§(this.§_-c1i§));
      }
      
      public function setData(param1:Array) : void
      {
         var paidScores:int;
         var i:int;
         var j:int = 0;
         var statusReset:§_-kr§ = null;
         var data:Array = param1;
         this.§_-R2O§ = 0;
         paidScores = 0;
         i = 0;
         while(i < this.skills.length)
         {
            j = 0;
            while(j < data.length)
            {
               if(data[j][0] == this.skills[i].id)
               {
                  break;
               }
               j++;
            }
            if(j == data.length)
            {
               this.skills[i].§_-nu§(0,0);
            }
            else
            {
               this.skills[i].§_-nu§(data[j][1],data[j][2]);
               this.§_-R2O§ += data[j][1];
               paidScores += data[j][2];
            }
            i++;
         }
         §_-4v§.§_-9d§(this.§_-c1i§,this.§_-R2O§,Math.floor(paidScores * 0.5));
         i = 0;
         while(i < this.skills.length)
         {
            if(this.skills[i].§_-43U§ > 0 || §_-4v§.§_-53u§(this.§_-c1i§,i) <= 0 && §_-4v§.§_-A3U§(this.§_-c1i§) > 0)
            {
               this.skills[i].§_-4S§(false);
            }
            else
            {
               this.skills[i].§_-4S§(true);
            }
            i++;
         }
         this.§_-C3g§.text = String(§_-4v§.§_-A3U§(this.§_-c1i§));
         if(this.§_-R2O§ == 0)
         {
            if(this.§_-9V§)
            {
               this.§_-9V§.visible = false;
            }
            return;
         }
         if(!this.§_-9V§)
         {
            this.§_-9V§ = new ResetBranchButton();
            this.§_-9V§.x = 5;
            this.§_-9V§.y = 5;
            this.§_-9V§.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
            {
               GameSounds.play(§_-RH§.CLICK);
               if(§_-c1i§ != §_-4v§.§_-71M§)
               {
                  return;
               }
               §_-4v§.§_-M2h§();
            });
            addChild(this.§_-9V§);
            statusReset = new §_-kr§(this.§_-9V§,"");
            statusReset.setStyle(this.style);
            statusReset.maxWidth = 200;
            statusReset.setStatus(§_-r1G§.tag("body") + §_-r1G§.span(gls("Сброс"),"bold") + gls("<br/>Вернуть все перья, потраченные на изучение навыков в этой профессии") + §_-r1G§.§_-43A§("body"));
         }
         this.§_-9V§.visible = true;
      }
      
      public function §_-o7§(param1:Boolean) : void
      {
         var i:int;
         var value:Boolean = param1;
         if(value)
         {
            if(this.§_-e1f§)
            {
               removeChild(this.§_-e1f§);
               this.§_-e1f§ = null;
            }
            if(this.blockImage)
            {
               TweenMax.to(this.blockImage,0.5,{
                  "autoAlpha":0,
                  "onComplete":function():void
                  {
                     removeChild(blockImage);
                     blockImage = null;
                  }
               });
            }
            return;
         }
         i = 0;
         while(i < this.skills.length)
         {
            this.skills[i].§_-4S§(true);
            i++;
         }
         if(!this.blockImage)
         {
            this.blockImage = new BlockWebImage();
            this.blockImage.y = 20;
            this.blockImage.mouseChildren = false;
            this.blockImage.mouseEnabled = false;
            addChild(this.blockImage);
         }
         this.blockImage.visible = true;
         if(!this.§_-e1f§)
         {
            this.§_-e1f§ = new BuyBranchButton();
            this.§_-e1f§.x = 5;
            this.§_-e1f§.y = 5;
            this.§_-e1f§.addEventListener(MouseEvent.CLICK,this.§_-Oe§);
            addChild(this.§_-e1f§);
            new §_-kr§(this.§_-e1f§,gls("Купить профессию"));
         }
         this.§_-e1f§.visible = true;
      }
      
      public function §_-4S§(param1:Boolean) : void
      {
         this.blocked = param1;
         this.§_-Y1m§.alpha = this.blocked ? 0 : 1;
         this.§_-e2R§.alpha = this.blocked ? 0.5 : 1;
         var _loc2_:int = 0;
         while(_loc2_ < this.skills.length)
         {
            this.skills[_loc2_].§_-X1U§(!this.blocked);
            _loc2_++;
         }
         if(this.§_-9V§)
         {
            this.§_-9V§.visible = !param1 && this.§_-R2O§ > 0;
         }
      }
      
      public function §_-z1X§() : void
      {
         this.skills[0].§_-4S§(false);
         this.§_-Y1m§.alpha = 0;
         if(this.blockImage)
         {
            this.blockImage.visible = false;
         }
         if(!this.§_-e1f§)
         {
            return;
         }
         this.§_-e1f§.visible = false;
      }
      
      private function §_-Oe§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.CLICK);
         §_-4v§.§_-Oe§(this.§_-c1i§);
      }
   }
}

