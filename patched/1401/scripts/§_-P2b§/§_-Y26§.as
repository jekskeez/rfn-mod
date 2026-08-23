package §_-P2b§
{
   import §_-42B§.TweenMax;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import utils.§_-23z§;
   
   public class §_-Y26§ extends §_-H2N§
   {
      
      private static const §_-h2z§:int = 15;
      
      private static const §_-PD§:int = 3;
      
      private var §_-21K§:Boolean = false;
      
      private var bonus:Number;
      
      public function §_-Y26§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "sparta";
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get activeTime() : Number
      {
         return 15;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.§_-738§ = true;
         this.§_-A2O§();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.§_-738§ = false;
         if(Boolean(this.hero) && this.hero.isSelf)
         {
            this.hero.heroView.§_-o2z§();
         }
      }
      
      private function set §_-738§(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Hero = null;
         if(this.§_-21K§ == param1)
         {
            return;
         }
         this.§_-21K§ = param1;
         if(param1)
         {
            _loc2_ = 0;
            for each(_loc3_ in this.hero.game.squirrels.players)
            {
               if(_loc3_.perkController.§_-e4§(this.§_-i2D§) != -1 && !_loc3_.isSelf && !_loc3_.shaman && !_loc3_.isDragon && !_loc3_.isHare && !_loc3_.isScrat)
               {
                  _loc2_++;
               }
            }
            this.bonus = this.hero.runSpeed * (§_-h2z§ + §_-PD§ * _loc2_) / 100;
         }
         this.hero.runSpeed += this.bonus * (param1 ? 1 : -1);
      }
      
      private function §_-A2O§() : void
      {
         if(!this.hero)
         {
            return;
         }
         if(this.hero.isSelf)
         {
            this.hero.heroView.§_-420§(new HighSpeedButton());
         }
         this.§_-032§();
      }
      
      private function §_-032§() : void
      {
         var format:TextFormat;
         var rot:§_-23z§;
         var dstX:int;
         var dstY:int;
         var sparta:Sprite = null;
         var messageField:§_-22V§ = null;
         sparta = new Sprite();
         sparta.x = this.hero.x + 15;
         sparta.y = this.hero.y - 42;
         format = new TextFormat(§_-22V§.§_-F2z§,20,16271104,true);
         format.leading = -4;
         format.align = TextFormatAlign.CENTER;
         messageField = new §_-22V§(gls("ЭТО СПАРТА!"),0,0,format);
         messageField.width = 180;
         messageField.wordWrap = true;
         messageField.multiline = true;
         messageField.filters = [new GlowFilter(16777113,1,2,2,2)];
         messageField.x = -90;
         sparta.addChild(messageField);
         rot = new §_-23z§(messageField,new Point(90,messageField.textHeight));
         rot.rotation = 20;
         this.hero.game.squirrels.addChild(sparta);
         dstX = messageField.x + 30;
         dstY = messageField.y - 50;
         TweenMax.to(messageField,0.9,{
            "x":dstX,
            "y":dstY,
            "onComplete":function():void
            {
               TweenMax.to(messageField,0.5,{
                  "delay":0.5,
                  "alpha":0,
                  "onComplete":function():void
                  {
                     if(sparta.parent != null)
                     {
                        sparta.parent.removeChild(sparta);
                     }
                  }
               });
            }
         });
      }
   }
}

