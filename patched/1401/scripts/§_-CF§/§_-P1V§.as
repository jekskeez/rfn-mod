package §_-CF§
{
   import §_-42B§.TweenMax;
   import §_-I10§.§_-ct§;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.Dialog;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.§_-xb§;
   
   public class §_-P1V§ extends Sprite
   {
      
      private static const §_-c1s§:int = 52;
      
      private static const §_-a1F§:int = 43;
      
      private static const §_-V0§:int = 67;
      
      private static const §_-Ta§:int = 65;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #1B120E;","text-align: left;","}",".bold {","font-weight: bold;","text-align: center;","}"].join("\n");
      
      public static const §_-h2m§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,21,16763904,null,null,null,null,null,"center");
      
      public static const §_-i1w§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,19,8812372,null,null,null,null,null,"right");
      
      private var skills:Vector.<§_-G1v§>;
      
      private var blocked:Boolean = true;
      
      private var §_-Wu§:int;
      
      private var §_-m2I§:§_-22V§;
      
      private var §_-937§:§_-22V§;
      
      private var §_-I2u§:int = 0;
      
      private var §_-MW§:SimpleButton = null;
      
      private var §_-P1a§:SimpleButton = null;
      
      private var style:StyleSheet;
      
      private var §_-c1v§:DisplayObject = null;
      
      private var blockImage:DisplayObjectContainer = null;
      
      public function §_-P1V§(param1:int, param2:Array)
      {
         var _loc10_:§_-G1v§ = null;
         super();
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         this.§_-Wu§ = param1;
         this.§_-c1v§ = new ActiveBranchImage();
         addChild(this.§_-c1v§);
         this.skills = new Vector.<§_-G1v§>();
         var _loc3_:int = §_-c1s§ + §_-V0§;
         var _loc4_:int = §_-a1F§;
         var _loc5_:int = 0;
         while(_loc5_ < param2.length)
         {
            if(_loc5_ == param2.length - 1)
            {
               _loc3_ = §_-c1s§ + §_-V0§;
            }
            _loc10_ = new §_-G1v§(param2[_loc5_],_loc5_,this.§_-Wu§);
            _loc10_.x = _loc3_;
            _loc10_.y = _loc4_;
            addChild(_loc10_);
            this.skills.push(_loc10_);
            if(_loc5_ == 0)
            {
               _loc3_ = §_-c1s§;
               _loc4_ += §_-Ta§;
            }
            else
            {
               _loc3_ += §_-V0§;
               if(_loc3_ == §_-c1s§ + 3 * §_-V0§)
               {
                  _loc3_ = §_-c1s§;
                  _loc4_ += §_-Ta§;
               }
            }
            _loc5_++;
         }
         this.§_-m2I§ = new §_-22V§(§_-ct§.§_-t1c§[this.§_-Wu§],40,0,§_-h2m§);
         this.§_-m2I§.filters = Dialog.§_-m2A§;
         this.§_-m2I§.width = 200;
         this.§_-m2I§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-m2I§);
         var _loc6_:§_-Hb§ = new §_-Hb§(this.§_-m2I§,"");
         _loc6_.setStyle(this.style);
         _loc6_.maxWidth = 220;
         _loc6_.setStatus(§_-ct§.§_-42u§(this.§_-Wu§));
         var _loc7_:Sprite = new Sprite();
         addChild(_loc7_);
         this.§_-937§ = new §_-22V§(String(§_-ct§.§_-s25§),155,0,§_-i1w§);
         this.§_-937§.autoSize = TextFieldAutoSize.RIGHT;
         _loc7_.addChild(this.§_-937§);
         var _loc8_:ImageIconFeather = new ImageIconFeather();
         _loc8_.x = 255;
         _loc8_.y = this.§_-937§.y + 1;
         _loc7_.addChild(_loc8_);
         var _loc9_:§_-Hb§ = new §_-Hb§(_loc7_,"");
         _loc9_.setStyle(this.style);
         _loc9_.maxWidth = 290;
         _loc9_.setStatus(§_-xb§.tag("body") + §_-xb§.span(gls("Перья"),"bold") + gls("<br />Шаман получает одно перо за каждый новый уровень<br/>Перья используются для изучения навыков шамана") + §_-xb§.§_-p1§("body"));
      }
      
      public function §_-zN§() : void
      {
         this.§_-937§.text = String(§_-ct§.§_-c1x§(this.§_-Wu§));
      }
      
      public function setData(param1:Array) : void
      {
         var paidScores:int;
         var i:int;
         var j:int = 0;
         var statusReset:§_-Hb§ = null;
         var data:Array = param1;
         this.§_-I2u§ = 0;
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
               this.skills[i].§_-X2t§(0,0);
            }
            else
            {
               this.skills[i].§_-X2t§(data[j][1],data[j][2]);
               this.§_-I2u§ += data[j][1];
               paidScores += data[j][2];
            }
            i++;
         }
         §_-ct§.§_-m1R§(this.§_-Wu§,this.§_-I2u§,Math.floor(paidScores * 0.5));
         i = 0;
         while(i < this.skills.length)
         {
            if(this.skills[i].§_-w1W§ > 0 || §_-ct§.§_-JN§(this.§_-Wu§,i) <= 0 && §_-ct§.§_-c1x§(this.§_-Wu§) > 0)
            {
               this.skills[i].§_-43I§(false);
            }
            else
            {
               this.skills[i].§_-43I§(true);
            }
            i++;
         }
         this.§_-937§.text = String(§_-ct§.§_-c1x§(this.§_-Wu§));
         if(this.§_-I2u§ == 0)
         {
            if(this.§_-MW§)
            {
               this.§_-MW§.visible = false;
            }
            return;
         }
         if(!this.§_-MW§)
         {
            this.§_-MW§ = new ResetBranchButton();
            this.§_-MW§.x = 5;
            this.§_-MW§.y = 5;
            this.§_-MW§.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
            {
               GameSounds.play(§_-43Z§.CLICK);
               if(§_-Wu§ != §_-ct§.§_-m1k§)
               {
                  return;
               }
               §_-ct§.§_-M2c§();
            });
            addChild(this.§_-MW§);
            statusReset = new §_-Hb§(this.§_-MW§,"");
            statusReset.setStyle(this.style);
            statusReset.maxWidth = 200;
            statusReset.setStatus(§_-xb§.tag("body") + §_-xb§.span(gls("Сброс"),"bold") + gls("<br/>Вернуть все перья, потраченные на изучение навыков в этой профессии") + §_-xb§.§_-p1§("body"));
         }
         this.§_-MW§.visible = true;
      }
      
      public function §_-F2K§(param1:Boolean) : void
      {
         var i:int;
         var value:Boolean = param1;
         if(value)
         {
            if(this.§_-P1a§)
            {
               removeChild(this.§_-P1a§);
               this.§_-P1a§ = null;
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
            this.skills[i].§_-43I§(true);
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
         if(!this.§_-P1a§)
         {
            this.§_-P1a§ = new BuyBranchButton();
            this.§_-P1a§.x = 5;
            this.§_-P1a§.y = 5;
            this.§_-P1a§.addEventListener(MouseEvent.CLICK,this.§_-qy§);
            addChild(this.§_-P1a§);
            new §_-Hb§(this.§_-P1a§,gls("Купить профессию"));
         }
         this.§_-P1a§.visible = true;
      }
      
      public function §_-43I§(param1:Boolean) : void
      {
         this.blocked = param1;
         this.§_-c1v§.alpha = this.blocked ? 0 : 1;
         this.§_-m2I§.alpha = this.blocked ? 0.5 : 1;
         var _loc2_:int = 0;
         while(_loc2_ < this.skills.length)
         {
            this.skills[_loc2_].§_-82§(!this.blocked);
            _loc2_++;
         }
         if(this.§_-MW§)
         {
            this.§_-MW§.visible = !param1 && this.§_-I2u§ > 0;
         }
      }
      
      public function §_-en§() : void
      {
         this.skills[0].§_-43I§(false);
         this.§_-c1v§.alpha = 0;
         if(this.blockImage)
         {
            this.blockImage.visible = false;
         }
         if(!this.§_-P1a§)
         {
            return;
         }
         this.§_-P1a§.visible = false;
      }
      
      private function §_-qy§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.CLICK);
         §_-ct§.§_-qy§(this.§_-Wu§);
      }
   }
}

