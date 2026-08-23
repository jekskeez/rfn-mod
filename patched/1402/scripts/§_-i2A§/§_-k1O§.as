package §_-i2A§
{
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-Wd§;
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import views.§_-914§;
   import views.§_-V2O§;
   import views.§_-l1W§;
   import views.§_-z§;
   
   public class §_-k1O§ extends Dialog
   {
      
      private static const §_-D5§:int = 0;
      
      private static const §_-k2I§:int = 1;
      
      private static const §_-63o§:int = 2;
      
      private static const §_-Z2r§:int = 5;
      
      private static const §_-z1c§:Array = [gls("Выбери предмет, который хочешь получить."),gls("Выбери предмет, который хочешь отдать взамен."),gls("Для подтверждения нажмите кнопку «Обменять»")];
      
      private static var _instance:§_-k1O§ = null;
      
      public static var §_-Y25§:Boolean = false;
      
      private var playerId:int = -1;
      
      private var friends:Array = [];
      
      private var lastIndex:int = 0;
      
      private var §_-n12§:§_-V2O§;
      
      private var §_-118§:§_-z§ = null;
      
      private var §_-J2R§:§_-l1W§;
      
      private var §_-96§:§_-914§;
      
      private var §_-g1§:§_-914§;
      
      private var §_-52E§:§_-K2G§;
      
      private var §_-4z§:Sprite;
      
      private var §_-33B§:Boolean = false;
      
      private var §_-A32§:Boolean = false;
      
      private var §_-P2L§:§_-i5§ = null;
      
      public function §_-k1O§()
      {
         super(gls("Обменяться коллекцией с друзьями"),true,true,null,false);
         this.init();
      }
      
      public static function §_-yC§(param1:int = -1) : void
      {
         if(!_instance)
         {
            _instance = new §_-k1O§();
         }
         _instance.§_-yC§(param1);
      }
      
      override public function show() : void
      {
         if(this.§_-A32§)
         {
            return;
         }
         if(this.playerId != -1)
         {
            this.§_-n12§.§_-yC§(Game.getPlayer(this.playerId));
            this.§_-118§.§_-yC§(Game.getPlayer(this.playerId));
         }
         super.show();
         this.§_-v18§();
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         this.playerId = -1;
         §_-Y25§ = false;
      }
      
      override protected function effectOpen() : void
      {
      }
      
      override protected function redrawModalBackdrop() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(0,0.1);
         this.graphics.drawRect(-this.x,-this.y,Game.starling.stage.stageWidth,Game.starling.stage.stageHeight);
      }
      
      private function init() : void
      {
         var _loc1_:DisplayObject = new DilaogCollectionBack();
         _loc1_.y = 86;
         addChild(_loc1_);
         this.§_-J2R§ = new §_-l1W§();
         this.§_-J2R§.x = 225;
         this.§_-J2R§.y = 245;
         this.§_-J2R§.addEventListener(Event.CHANGE,this.exchange);
         addChild(this.§_-J2R§);
         this.§_-96§ = new §_-914§(true);
         this.§_-96§.y = 10;
         this.§_-96§.addEventListener(Event.CHANGE,this.§_-v18§);
         addChild(this.§_-96§);
         this.§_-g1§ = new §_-914§(false);
         this.§_-g1§.x = -30;
         this.§_-g1§.y = 140;
         this.§_-g1§.addEventListener(Event.CHANGE,this.§_-v18§);
         addChild(this.§_-g1§);
         this.§_-n12§ = new §_-V2O§(65);
         this.§_-n12§.x = 45;
         this.§_-n12§.y = 135;
         this.§_-n12§.mouseEnabled = false;
         this.§_-n12§.mouseChildren = false;
         addChild(this.§_-n12§);
         var _loc2_:RatingPlaceButton = new RatingPlaceButton();
         _loc2_.width = this.§_-n12§.width;
         _loc2_.height = this.§_-n12§.height;
         this.§_-n12§.addChild(_loc2_);
         this.§_-118§ = new §_-z§(8);
         this.§_-118§.x = 97;
         this.§_-118§.y = 140;
         addChild(this.§_-118§);
         this.§_-52E§ = new §_-K2G§(gls("Поиск по друзьям"));
         this.§_-52E§.x = int((this.§_-96§.width - this.§_-52E§.width) * 0.5);
         this.§_-52E§.y = 75;
         this.§_-52E§.addEventListener(MouseEvent.CLICK,this.§_-wV§);
         addChild(this.§_-52E§);
         this.§_-4z§ = new Sprite();
         this.§_-4z§.x = 155;
         this.§_-4z§.y = 70;
         this.§_-4z§.addChild(new §_-i5§(gls("К сожалению, у тебя нет друзей, которые\nобмениваются коллекциями"),0,0,new TextFormat(null,16,6697728,false,null,null,null,null,"center")));
         var _loc3_:§_-K2G§ = new §_-K2G§(gls("Пригласить друзей"));
         _loc3_.x = int((this.§_-4z§.width - _loc3_.width) * 0.5);
         _loc3_.y = 90;
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-B2J§);
         this.§_-4z§.addChild(_loc3_);
         _loc1_ = new ImageNoFriends();
         _loc1_.x = this.§_-4z§.width - 45;
         _loc1_.y = 20;
         _loc1_.scaleX = _loc1_.scaleY = 0.6;
         this.§_-4z§.addChild(_loc1_);
         addChild(this.§_-4z§);
         var _loc4_:TextFormat = new TextFormat(null,12,7168849,true);
         _loc4_.align = TextFormatAlign.CENTER;
         var _loc5_:Sprite = new Sprite();
         _loc5_.x = 25;
         _loc5_.y = 240;
         _loc5_.graphics.beginFill(16777215);
         _loc5_.graphics.drawRoundRect(0,0,175,70,10,10);
         _loc5_.graphics.drawTriangles(Vector.<Number>([175,25,175,45,185,35]));
         _loc5_.filters = [new DropShadowFilter(1,45,0,1,9,9,0.5)];
         addChild(_loc5_);
         this.§_-P2L§ = new §_-i5§(gls("Выбери предмет, который хочешь получить."),0,0,_loc4_);
         this.§_-P2L§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-P2L§.multiline = true;
         this.§_-P2L§.wordWrap = true;
         this.§_-P2L§.width = 175;
         _loc5_.addChild(this.§_-P2L§);
         place();
         this.width = 650;
         this.height = 370;
         Game.listen(this.§_-Y16§);
      }
      
      private function §_-wV§(param1:MouseEvent) : void
      {
         this.§_-yC§(-1);
      }
      
      private function §_-B2J§(param1:MouseEvent) : void
      {
         Game.inviteFriends();
         this.hide();
      }
      
      private function §_-yC§(param1:int = -1) : void
      {
         var _loc2_:int = 0;
         this.§_-A32§ = false;
         this.playerId = param1;
         this.§_-4z§.visible = false;
         this.§_-n12§.visible = true;
         this.§_-118§.visible = true;
         this.§_-g1§.visible = true;
         this.§_-52E§.visible = true;
         if(this.playerId != -1)
         {
            Game.request(this.playerId,§_-Y2E§.§_-CN§ | §_-Y2E§.§_-V2n§,true);
         }
         else
         {
            if(Game.§_-82§.length == 0)
            {
               this.§_-4z§.visible = true;
               this.§_-n12§.visible = false;
               this.§_-118§.visible = false;
               this.§_-g1§.visible = false;
               this.§_-52E§.visible = false;
               if(§_-Y25§)
               {
                  Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-12L§,1);
               }
               this.show();
               return;
            }
            if(this.lastIndex >= Game.§_-82§.length)
            {
               this.lastIndex = 0;
               if(!this.§_-33B§)
               {
                  this.§_-n8§();
               }
               else
               {
                  this.§_-yC§(-1);
               }
               this.§_-33B§ = false;
            }
            else
            {
               _loc2_ = §_-Z2r§ - this.friends.length;
               this.friends = this.friends.concat(Game.§_-82§.slice(this.lastIndex,Math.min(Game.§_-82§.length,this.lastIndex + _loc2_)));
               Game.request(this.friends,§_-Y2E§.§_-CN§ | §_-Y2E§.§_-V2n§,true);
               this.lastIndex += _loc2_;
            }
         }
      }
      
      private function setStatus(param1:int) : void
      {
         this.§_-P2L§.text = §_-z1c§[param1];
         this.§_-P2L§.y = 35 - int(this.§_-P2L§.textHeight * 0.5);
      }
      
      private function exchange(param1:Event) : void
      {
         if(§_-Wd§.§_-xR§)
         {
            return;
         }
         if(Game.§_-v1T§ < Game.§_-kd§)
         {
            return;
         }
         if(§_-Y25§)
         {
            Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-12L§,1);
         }
         Connection.§_-e2T§(§_-u1O§.§_-CN§,this.playerId,this.§_-96§.§_-w2w§,this.§_-g1§.§_-w2w§);
         this.hide();
      }
      
      private function §_-Y16§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(this.playerId == -1 ? this.friends.indexOf(_loc2_.id) == -1 : _loc2_.id != this.playerId)
         {
            return;
         }
         if(this.playerId == -1)
         {
            this.friends.splice(this.friends.indexOf(_loc2_.id),1);
         }
         if(!this.§_-W1o§(_loc2_))
         {
            if(this.playerId != -1)
            {
               this.§_-n8§();
            }
            else if(this.friends.length == 0)
            {
               this.§_-yC§(-1);
            }
            return;
         }
         if(!this.visible)
         {
            this.show();
         }
         if(this.playerId == -1)
         {
            this.§_-33B§ = true;
         }
         this.playerId = _loc2_.id;
         this.§_-g1§.§_-yC§(_loc2_,§_-LZ§.§_-mA§);
         this.§_-96§.§_-yC§(Game.self,_loc2_.level);
         this.§_-v18§();
      }
      
      private function §_-n8§() : void
      {
         super.hide();
         this.§_-A32§ = true;
         this.playerId = -1;
         §_-6k§.show();
      }
      
      private function §_-v18§(param1:Event = null) : void
      {
         this.§_-J2R§.change(this.§_-g1§.§_-w2w§,this.§_-96§.§_-w2w§);
         if(this.§_-96§.§_-w2w§ == -1)
         {
            this.setStatus(§_-k1O§.§_-k2I§);
         }
         else if(this.§_-g1§.§_-w2w§ == -1)
         {
            this.setStatus(§_-k1O§.§_-D5§);
         }
         else
         {
            this.setStatus(§_-k1O§.§_-63o§);
         }
      }
      
      private function §_-W1o§(param1:Player) : Boolean
      {
         return "collection_exchange" in param1 && param1["collection_exchange"].length != 0;
      }
   }
}

