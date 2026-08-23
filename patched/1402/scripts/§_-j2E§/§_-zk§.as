package §_-j2E§
{
   import §_-22D§.TweenMax;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import utils.§_-L14§;
   
   public class §_-zk§ extends §_-92f§
   {
      
      private static const §_-J1§:int = 15;
      
      private static const §_-Q1S§:int = 3;
      
      private var §_-E2P§:Boolean = false;
      
      private var bonus:Number;
      
      public function §_-zk§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "sparta";
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
         this.§_-BY§ = true;
         this.§_-v2L§();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.§_-BY§ = false;
         if(Boolean(this.hero) && this.hero.isSelf)
         {
            this.hero.heroView.§_-A2l§();
         }
      }
      
      private function set §_-BY§(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Hero = null;
         if(this.§_-E2P§ == param1)
         {
            return;
         }
         this.§_-E2P§ = param1;
         if(param1)
         {
            _loc2_ = 0;
            for each(_loc3_ in this.hero.game.squirrels.players)
            {
               if(_loc3_.perkController.§_-S1Q§(this.§_-T2a§) != -1 && !_loc3_.isSelf && !_loc3_.shaman && !_loc3_.isDragon && !_loc3_.isHare && !_loc3_.isScrat)
               {
                  _loc2_++;
               }
            }
            this.bonus = this.hero.runSpeed * (§_-J1§ + §_-Q1S§ * _loc2_) / 100;
         }
         this.hero.runSpeed += this.bonus * (param1 ? 1 : -1);
      }
      
      private function §_-v2L§() : void
      {
         if(!this.hero)
         {
            return;
         }
         if(this.hero.isSelf)
         {
            this.hero.heroView.§_-C1X§(new HighSpeedButton());
         }
         this.§_-r2b§();
      }
      
      private function §_-r2b§() : void
      {
         var format:TextFormat;
         var rot:§_-L14§;
         var dstX:int;
         var dstY:int;
         var sparta:Sprite = null;
         var messageField:§_-i5§ = null;
         sparta = new Sprite();
         sparta.x = this.hero.x + 15;
         sparta.y = this.hero.y - 42;
         format = new TextFormat(§_-i5§.§_-c10§,20,16271104,true);
         format.leading = -4;
         format.align = TextFormatAlign.CENTER;
         messageField = new §_-i5§(gls("ЭТО СПАРТА!"),0,0,format);
         messageField.width = 180;
         messageField.wordWrap = true;
         messageField.multiline = true;
         messageField.filters = [new GlowFilter(16777113,1,2,2,2)];
         messageField.x = -90;
         sparta.addChild(messageField);
         rot = new §_-L14§(messageField,new Point(90,messageField.textHeight));
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

