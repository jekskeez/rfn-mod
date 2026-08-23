package §_-bN§
{
   import §_-X1k§.NotificationManager;
   import §_-a11§.TapeDataEvent;
   import buttons.§_-K2G§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import tape.§_-11R§;
   import tape.§_-ST§;
   import views.§_-g2O§;
   
   public class §_-M1x§ extends Dialog
   {
      
      private static const §_-m1q§:Array = [new GlowFilter(16777215,1,2,2,4)];
      
      private static var _instance:§_-M1x§ = null;
      
      private var §_-iN§:§_-11R§ = null;
      
      private var §_-C22§:§_-ST§ = null;
      
      private var §_-01z§:§_-g2O§ = null;
      
      private var §_-d17§:Array = [];
      
      private var §_-30§:§_-j1F§;
      
      public function §_-M1x§()
      {
         super(gls("Верни друзей"));
         this.init();
         _instance = this;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-E1§]);
      }
      
      public static function §_-41j§(param1:int, param2:Boolean) : void
      {
         if(_instance)
         {
            _instance.§_-41j§(param1,param2);
         }
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-01q§ = 20;
         this.§_-7N§ = 5;
         this.topOffset = 10;
         this.§_-f2d§ = 0;
      }
      
      override public function show() : void
      {
         if(this.§_-C22§.count > 0)
         {
            super.show();
            if(this.§_-30§)
            {
               this.§_-30§.hide();
            }
         }
         else
         {
            if(!this.§_-30§)
            {
               this.§_-30§ = new §_-j1F§();
            }
            this.§_-30§.show();
         }
         §_-L1H§.hide(NotificationManager.§_-53c§);
      }
      
      private function init() : void
      {
         var _loc1_:DialogReturnFriendsBack = new DialogReturnFriendsBack();
         _loc1_.y = 10;
         addChild(_loc1_);
         var _loc2_:Sprite = new ImageIconSquirrel();
         _loc2_.x = _loc1_.x + 80;
         _loc2_.y = _loc1_.y + 55;
         _loc2_.filters = §_-m1q§;
         addChild(_loc2_);
         _loc2_ = new ImageIconNut();
         _loc2_.x = _loc1_.x + 191;
         _loc2_.y = _loc1_.y + 61;
         _loc2_.filters = §_-m1q§;
         addChild(_loc2_);
         _loc2_ = new ImageIconExp();
         _loc2_.x = _loc1_.x + 287.5;
         _loc2_.y = _loc1_.y + 61;
         _loc2_.filters = §_-m1q§;
         addChild(_loc2_);
         var _loc3_:ButtonSelectAllFriends = new ButtonSelectAllFriends();
         _loc3_.x = _loc1_.x + _loc1_.width - _loc3_.width - 10;
         _loc3_.y = _loc1_.y + _loc1_.height - _loc3_.height - 10;
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-W1L§);
         addChild(_loc3_);
         var _loc4_:§_-K2G§ = new §_-K2G§(gls("Вернуть друзей"));
         _loc4_.x = (this.§_-01q§ + this.§_-7N§ + _loc1_.width - _loc4_.width) * 0.5;
         _loc4_.y = _loc1_.y + _loc1_.height + 10;
         _loc4_.addEventListener(MouseEvent.CLICK,this.§_-71u§);
         addChild(_loc4_);
         var _loc5_:§_-i5§ = new §_-i5§(gls("Твоя максимальная награда за возвращение друзей:"),92,15,new TextFormat(null,14,5190674,true,null,null,null,null,"center"));
         _loc5_.x = (_loc1_.width - _loc5_.width) * 0.5;
         _loc5_.y = _loc1_.y + 10;
         addChild(_loc5_);
         _loc5_ = new §_-i5§(gls("Выбери друзей, которых ты хочешь вернуть в игру:"),30,125,new TextFormat(null,14,5190674,true));
         _loc5_.x = (_loc1_.width - _loc5_.width) * 0.5;
         _loc5_.y = _loc1_.y + 125;
         addChild(_loc5_);
         this.§_-01z§ = new §_-g2O§();
         this.§_-01z§.x = 55;
         this.§_-01z§.y = 40;
         addChild(this.§_-01z§);
         this.§_-C22§ = new §_-ST§();
         this.§_-C22§.addEventListener(TapeDataEvent.UPDATE,this.§_-ZU§);
         this.§_-iN§ = new §_-11R§();
         this.§_-iN§.x = 4;
         this.§_-iN§.y = 160;
         this.§_-iN§.setData(this.§_-C22§);
         addChild(this.§_-iN§);
         place();
         this.width += 15;
         this.height += 50;
         this.§_-x2T§.x -= 25;
      }
      
      private function §_-W1L§(param1:MouseEvent) : void
      {
         this.§_-C22§.§_-W1L§(this.§_-d17§.length == 0);
      }
      
      private function §_-71u§(param1:MouseEvent) : void
      {
         hide();
         if(this.§_-d17§.length > 0)
         {
            Connection.§_-e2T§(§_-u1O§.§_-V1l§,this.§_-d17§);
         }
      }
      
      private function §_-41j§(param1:int, param2:Boolean) : void
      {
         var _loc3_:int = this.§_-d17§.indexOf(param1);
         if(param2 && _loc3_ == -1)
         {
            this.§_-d17§.push(param1);
         }
         if(!param2 && _loc3_ != -1)
         {
            this.§_-d17§.splice(_loc3_,1);
         }
         this.§_-ZU§();
      }
      
      private function §_-ZU§(param1:Event = null) : void
      {
         this.§_-01z§.count = this.§_-d17§.length;
         if(this.§_-C22§.count > 0)
         {
            return;
         }
         hide();
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Array = [];
         var _loc3_:Array = param1[0];
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_ + 1])
            {
               _loc2_.push(_loc3_[_loc4_]);
               this.§_-d17§.splice(this.§_-d17§.indexOf(_loc3_[_loc4_]),1);
            }
            _loc4_ += 2;
         }
         if(_loc2_.length > 0)
         {
            new §_-Fk§(gls("Приглашения друзьям отправлены"),"",false,null,210).showDialog();
         }
         this.§_-C22§.§_-93r§(_loc2_);
         this.§_-iN§.offset = 0;
         this.§_-ZU§();
      }
   }
}

