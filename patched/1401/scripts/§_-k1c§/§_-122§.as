package §_-k1c§
{
   import §_-I10§.NotificationManager;
   import §_-r2Y§.TapeDataEvent;
   import buttons.§_-j18§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import tape.§_-bN§;
   import tape.§_-ch§;
   import views.§_-I2Z§;
   
   public class §_-122§ extends Dialog
   {
      
      private static const §_-Q2u§:Array = [new GlowFilter(16777215,1,2,2,4)];
      
      private static var _instance:§_-122§ = null;
      
      private var §_-92G§:§_-ch§ = null;
      
      private var §_-v1M§:§_-bN§ = null;
      
      private var §_-F1J§:§_-I2Z§ = null;
      
      private var §_-e1Z§:Array = [];
      
      private var §_-h17§:§_-Ze§;
      
      public function §_-122§()
      {
         super(gls("Верни друзей"));
         this.init();
         _instance = this;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-VA§]);
      }
      
      public static function §_-B1L§(param1:int, param2:Boolean) : void
      {
         if(_instance)
         {
            _instance.§_-B1L§(param1,param2);
         }
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-R1Y§ = 20;
         this.§_-4n§ = 5;
         this.topOffset = 10;
         this.§_-JZ§ = 0;
      }
      
      override public function show() : void
      {
         if(this.§_-v1M§.count > 0)
         {
            super.show();
            if(this.§_-h17§)
            {
               this.§_-h17§.hide();
            }
         }
         else
         {
            if(!this.§_-h17§)
            {
               this.§_-h17§ = new §_-Ze§();
            }
            this.§_-h17§.show();
         }
         §_-fO§.hide(NotificationManager.§_-C2F§);
      }
      
      private function init() : void
      {
         var _loc1_:DialogReturnFriendsBack = new DialogReturnFriendsBack();
         _loc1_.y = 10;
         addChild(_loc1_);
         var _loc2_:Sprite = new ImageIconSquirrel();
         _loc2_.x = _loc1_.x + 80;
         _loc2_.y = _loc1_.y + 55;
         _loc2_.filters = §_-Q2u§;
         addChild(_loc2_);
         _loc2_ = new ImageIconNut();
         _loc2_.x = _loc1_.x + 191;
         _loc2_.y = _loc1_.y + 61;
         _loc2_.filters = §_-Q2u§;
         addChild(_loc2_);
         _loc2_ = new ImageIconExp();
         _loc2_.x = _loc1_.x + 287.5;
         _loc2_.y = _loc1_.y + 61;
         _loc2_.filters = §_-Q2u§;
         addChild(_loc2_);
         var _loc3_:ButtonSelectAllFriends = new ButtonSelectAllFriends();
         _loc3_.x = _loc1_.x + _loc1_.width - _loc3_.width - 10;
         _loc3_.y = _loc1_.y + _loc1_.height - _loc3_.height - 10;
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-WG§);
         addChild(_loc3_);
         var _loc4_:§_-j18§ = new §_-j18§(gls("Вернуть друзей"));
         _loc4_.x = (this.§_-R1Y§ + this.§_-4n§ + _loc1_.width - _loc4_.width) * 0.5;
         _loc4_.y = _loc1_.y + _loc1_.height + 10;
         _loc4_.addEventListener(MouseEvent.CLICK,this.§_-o27§);
         addChild(_loc4_);
         var _loc5_:§_-22V§ = new §_-22V§(gls("Твоя максимальная награда за возвращение друзей:"),92,15,new TextFormat(null,14,5190674,true,null,null,null,null,"center"));
         _loc5_.x = (_loc1_.width - _loc5_.width) * 0.5;
         _loc5_.y = _loc1_.y + 10;
         addChild(_loc5_);
         _loc5_ = new §_-22V§(gls("Выбери друзей, которых ты хочешь вернуть в игру:"),30,125,new TextFormat(null,14,5190674,true));
         _loc5_.x = (_loc1_.width - _loc5_.width) * 0.5;
         _loc5_.y = _loc1_.y + 125;
         addChild(_loc5_);
         this.§_-F1J§ = new §_-I2Z§();
         this.§_-F1J§.x = 55;
         this.§_-F1J§.y = 40;
         addChild(this.§_-F1J§);
         this.§_-v1M§ = new §_-bN§();
         this.§_-v1M§.addEventListener(TapeDataEvent.UPDATE,this.§_-l13§);
         this.§_-92G§ = new §_-ch§();
         this.§_-92G§.x = 4;
         this.§_-92G§.y = 160;
         this.§_-92G§.setData(this.§_-v1M§);
         addChild(this.§_-92G§);
         place();
         this.width += 15;
         this.height += 50;
         this.§_-O2e§.x -= 25;
      }
      
      private function §_-WG§(param1:MouseEvent) : void
      {
         this.§_-v1M§.§_-WG§(this.§_-e1Z§.length == 0);
      }
      
      private function §_-o27§(param1:MouseEvent) : void
      {
         hide();
         if(this.§_-e1Z§.length > 0)
         {
            Connection.§_-Li§(§_-h2B§.§_-d27§,this.§_-e1Z§);
         }
      }
      
      private function §_-B1L§(param1:int, param2:Boolean) : void
      {
         var _loc3_:int = this.§_-e1Z§.indexOf(param1);
         if(param2 && _loc3_ == -1)
         {
            this.§_-e1Z§.push(param1);
         }
         if(!param2 && _loc3_ != -1)
         {
            this.§_-e1Z§.splice(_loc3_,1);
         }
         this.§_-l13§();
      }
      
      private function §_-l13§(param1:Event = null) : void
      {
         this.§_-F1J§.count = this.§_-e1Z§.length;
         if(this.§_-v1M§.count > 0)
         {
            return;
         }
         hide();
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Array = [];
         var _loc3_:Array = param1[0];
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_ + 1])
            {
               _loc2_.push(_loc3_[_loc4_]);
               this.§_-e1Z§.splice(this.§_-e1Z§.indexOf(_loc3_[_loc4_]),1);
            }
            _loc4_ += 2;
         }
         if(_loc2_.length > 0)
         {
            new §_-Q13§(gls("Приглашения друзьям отправлены"),"",false,null,210).showDialog();
         }
         this.§_-v1M§.§_-C2N§(_loc2_);
         this.§_-92G§.offset = 0;
         this.§_-l13§();
      }
   }
}

