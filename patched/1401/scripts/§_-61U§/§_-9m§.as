package §_-61U§
{
   import §_-I10§.§_-S16§;
   import §_-I10§.§_-d2x§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
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
   import protocol.§_-h2B§;
   import views.§_-933§;
   import views.§_-B1w§;
   import views.§_-r1c§;
   import views.§_-s1A§;
   
   public class §_-9m§ extends Dialog
   {
      
      private static const §_-Oa§:int = 0;
      
      private static const §_-22w§:int = 1;
      
      private static const §_-85§:int = 2;
      
      private static const §_-110§:int = 5;
      
      private static const §_-Th§:Array = [gls("Выбери предмет, который хочешь получить."),gls("Выбери предмет, который хочешь отдать взамен."),gls("Для подтверждения нажмите кнопку «Обменять»")];
      
      private static var _instance:§_-9m§ = null;
      
      public static var §_-U1L§:Boolean = false;
      
      private var playerId:int = -1;
      
      private var friends:Array = [];
      
      private var lastIndex:int = 0;
      
      private var §_-M18§:§_-s1A§;
      
      private var §_-Gg§:§_-B1w§ = null;
      
      private var §_-va§:§_-933§;
      
      private var §_-Ms§:§_-r1c§;
      
      private var §_-41q§:§_-r1c§;
      
      private var §_-dm§:§_-j18§;
      
      private var §_-pX§:Sprite;
      
      private var §_-x1Y§:Boolean = false;
      
      private var §_-J1r§:Boolean = false;
      
      private var §_-51Y§:§_-22V§ = null;
      
      public function §_-9m§()
      {
         super(gls("Обменяться коллекцией с друзьями"),true,true,null,false);
         this.init();
      }
      
      public static function §_-031§(param1:int = -1) : void
      {
         if(!_instance)
         {
            _instance = new §_-9m§();
         }
         _instance.§_-031§(param1);
      }
      
      override public function show() : void
      {
         if(this.§_-J1r§)
         {
            return;
         }
         if(this.playerId != -1)
         {
            this.§_-M18§.§_-031§(Game.getPlayer(this.playerId));
            this.§_-Gg§.§_-031§(Game.getPlayer(this.playerId));
         }
         super.show();
         this.§_-B22§();
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         this.playerId = -1;
         §_-U1L§ = false;
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
         this.§_-va§ = new §_-933§();
         this.§_-va§.x = 225;
         this.§_-va§.y = 245;
         this.§_-va§.addEventListener(Event.CHANGE,this.exchange);
         addChild(this.§_-va§);
         this.§_-Ms§ = new §_-r1c§(true);
         this.§_-Ms§.y = 10;
         this.§_-Ms§.addEventListener(Event.CHANGE,this.§_-B22§);
         addChild(this.§_-Ms§);
         this.§_-41q§ = new §_-r1c§(false);
         this.§_-41q§.x = -30;
         this.§_-41q§.y = 140;
         this.§_-41q§.addEventListener(Event.CHANGE,this.§_-B22§);
         addChild(this.§_-41q§);
         this.§_-M18§ = new §_-s1A§(65);
         this.§_-M18§.x = 45;
         this.§_-M18§.y = 135;
         this.§_-M18§.mouseEnabled = false;
         this.§_-M18§.mouseChildren = false;
         addChild(this.§_-M18§);
         var _loc2_:RatingPlaceButton = new RatingPlaceButton();
         _loc2_.width = this.§_-M18§.width;
         _loc2_.height = this.§_-M18§.height;
         this.§_-M18§.addChild(_loc2_);
         this.§_-Gg§ = new §_-B1w§(8);
         this.§_-Gg§.x = 97;
         this.§_-Gg§.y = 140;
         addChild(this.§_-Gg§);
         this.§_-dm§ = new §_-j18§(gls("Поиск по друзьям"));
         this.§_-dm§.x = int((this.§_-Ms§.width - this.§_-dm§.width) * 0.5);
         this.§_-dm§.y = 75;
         this.§_-dm§.addEventListener(MouseEvent.CLICK,this.§_-023§);
         addChild(this.§_-dm§);
         this.§_-pX§ = new Sprite();
         this.§_-pX§.x = 155;
         this.§_-pX§.y = 70;
         this.§_-pX§.addChild(new §_-22V§(gls("К сожалению, у тебя нет друзей, которые\nобмениваются коллекциями"),0,0,new TextFormat(null,16,6697728,false,null,null,null,null,"center")));
         var _loc3_:§_-j18§ = new §_-j18§(gls("Пригласить друзей"));
         _loc3_.x = int((this.§_-pX§.width - _loc3_.width) * 0.5);
         _loc3_.y = 90;
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-X2W§);
         this.§_-pX§.addChild(_loc3_);
         _loc1_ = new ImageNoFriends();
         _loc1_.x = this.§_-pX§.width - 45;
         _loc1_.y = 20;
         _loc1_.scaleX = _loc1_.scaleY = 0.6;
         this.§_-pX§.addChild(_loc1_);
         addChild(this.§_-pX§);
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
         this.§_-51Y§ = new §_-22V§(gls("Выбери предмет, который хочешь получить."),0,0,_loc4_);
         this.§_-51Y§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-51Y§.multiline = true;
         this.§_-51Y§.wordWrap = true;
         this.§_-51Y§.width = 175;
         _loc5_.addChild(this.§_-51Y§);
         place();
         this.width = 650;
         this.height = 370;
         Game.listen(this.§_-P9§);
      }
      
      private function §_-023§(param1:MouseEvent) : void
      {
         this.§_-031§(-1);
      }
      
      private function §_-X2W§(param1:MouseEvent) : void
      {
         Game.inviteFriends();
         this.hide();
      }
      
      private function §_-031§(param1:int = -1) : void
      {
         var _loc2_:int = 0;
         this.§_-J1r§ = false;
         this.playerId = param1;
         this.§_-pX§.visible = false;
         this.§_-M18§.visible = true;
         this.§_-Gg§.visible = true;
         this.§_-41q§.visible = true;
         this.§_-dm§.visible = true;
         if(this.playerId != -1)
         {
            Game.request(this.playerId,§_-hF§.§_-C§ | §_-hF§.§_-P13§,true);
         }
         else
         {
            if(Game.§_-t1u§.length == 0)
            {
               this.§_-pX§.visible = true;
               this.§_-M18§.visible = false;
               this.§_-Gg§.visible = false;
               this.§_-41q§.visible = false;
               this.§_-dm§.visible = false;
               if(§_-U1L§)
               {
                  Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-81q§,1);
               }
               this.show();
               return;
            }
            if(this.lastIndex >= Game.§_-t1u§.length)
            {
               this.lastIndex = 0;
               if(!this.§_-x1Y§)
               {
                  this.§_-B20§();
               }
               else
               {
                  this.§_-031§(-1);
               }
               this.§_-x1Y§ = false;
            }
            else
            {
               _loc2_ = §_-110§ - this.friends.length;
               this.friends = this.friends.concat(Game.§_-t1u§.slice(this.lastIndex,Math.min(Game.§_-t1u§.length,this.lastIndex + _loc2_)));
               Game.request(this.friends,§_-hF§.§_-C§ | §_-hF§.§_-P13§,true);
               this.lastIndex += _loc2_;
            }
         }
      }
      
      private function setStatus(param1:int) : void
      {
         this.§_-51Y§.text = §_-Th§[param1];
         this.§_-51Y§.y = 35 - int(this.§_-51Y§.textHeight * 0.5);
      }
      
      private function exchange(param1:Event) : void
      {
         if(§_-S16§.§_-j1Q§)
         {
            return;
         }
         if(Game.§_-I2M§ < Game.§_-z2b§)
         {
            return;
         }
         if(§_-U1L§)
         {
            Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-81q§,1);
         }
         Connection.§_-Li§(§_-h2B§.§_-C§,this.playerId,this.§_-Ms§.§_-z2f§,this.§_-41q§.§_-z2f§);
         this.hide();
      }
      
      private function §_-P9§(param1:PlayerEvent) : void
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
         if(!this.§_-k17§(_loc2_))
         {
            if(this.playerId != -1)
            {
               this.§_-B20§();
            }
            else if(this.friends.length == 0)
            {
               this.§_-031§(-1);
            }
            return;
         }
         if(!this.visible)
         {
            this.show();
         }
         if(this.playerId == -1)
         {
            this.§_-x1Y§ = true;
         }
         this.playerId = _loc2_.id;
         this.§_-41q§.§_-031§(_loc2_,§_-d2x§.§_-z2o§);
         this.§_-Ms§.§_-031§(Game.self,_loc2_.level);
         this.§_-B22§();
      }
      
      private function §_-B20§() : void
      {
         super.hide();
         this.§_-J1r§ = true;
         this.playerId = -1;
         §_-oH§.show();
      }
      
      private function §_-B22§(param1:Event = null) : void
      {
         this.§_-va§.change(this.§_-41q§.§_-z2f§,this.§_-Ms§.§_-z2f§);
         if(this.§_-Ms§.§_-z2f§ == -1)
         {
            this.setStatus(§_-9m§.§_-22w§);
         }
         else if(this.§_-41q§.§_-z2f§ == -1)
         {
            this.setStatus(§_-9m§.§_-Oa§);
         }
         else
         {
            this.setStatus(§_-9m§.§_-85§);
         }
      }
      
      private function §_-k17§(param1:Player) : Boolean
      {
         return "collection_exchange" in param1 && param1["collection_exchange"].length != 0;
      }
   }
}

