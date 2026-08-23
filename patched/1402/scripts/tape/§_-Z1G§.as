package tape
{
   import §_-a11§.§_-h2m§;
   import buttons.§_-613§;
   import com.api.Friend;
   import com.api.FriendEvent;
   import com.api.Services;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import utils.§_-O1q§;
   
   public class §_-Z1G§ extends §_-QN§
   {
      
      public var id:String;
      
      private var §_-H2R§:§_-613§ = null;
      
      private var _selected:Boolean = true;
      
      private var §_-EC§:§_-i5§;
      
      private var photo:§_-O1q§;
      
      public function §_-Z1G§(param1:String, param2:Boolean = false)
      {
         var _loc8_:DisplayObject = null;
         var _loc9_:InviteFriendCheckBox = null;
         super();
         this.id = param1;
         var _loc3_:Friend = Services.friends.getFriend(param1);
         _loc3_.addEventListener(FriendEvent.INFO_LOADED,this.§_-b27§);
         if(!param2)
         {
            _loc8_ = new ButtonBankItem().upState;
            _loc8_.width = 244;
            _loc8_.height = 50;
            addChild(_loc8_);
         }
         var _loc4_:Sprite = new Sprite();
         _loc4_.graphics.beginFill(16777215,1);
         _loc4_.graphics.drawRect(0,0,50,50);
         _loc4_.x = 4;
         _loc4_.y = 0;
         addChild(_loc4_);
         this.photo = new §_-O1q§("",4,0,50,50);
         addChild(this.photo);
         var _loc5_:InviteFriendPhoto = new InviteFriendPhoto();
         _loc5_.y = -4;
         addChild(_loc5_);
         if(!param2)
         {
            this.§_-EC§ = new §_-i5§("",_loc5_.x + _loc5_.width + 4,12,new TextFormat(§_-i5§.§_-c10§,16,6504987,true));
            this.§_-EC§.maxChars = 15;
            addChild(this.§_-EC§);
         }
         if(!param2)
         {
            _loc9_ = new InviteFriendCheckBox();
            _loc9_.x = _loc8_.width - 40;
            _loc9_.y = 9;
            addChild(_loc9_);
         }
         var _loc6_:SetDecorationButton = new SetDecorationButton();
         _loc6_.x = 12;
         _loc6_.y = -5;
         _loc6_.scaleX = _loc6_.scaleY = 2;
         _loc6_.addEventListener(MouseEvent.CLICK,this.§_-ij§);
         var _loc7_:HideDecorationButton = new HideDecorationButton();
         _loc7_.x = 5;
         _loc7_.scaleX = _loc7_.scaleY = 2;
         _loc7_.addEventListener(MouseEvent.CLICK,this.§_-ij§);
         if(!param2)
         {
            this.§_-H2R§ = new §_-613§(_loc6_,_loc7_,true);
            this.§_-H2R§.x = _loc8_.width - 50;
            this.§_-H2R§.y = 9;
            this.§_-H2R§.setState(true);
            addChild(this.§_-H2R§);
         }
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         if(this.§_-H2R§)
         {
            this.§_-H2R§.setState(this._selected);
         }
      }
      
      private function §_-ij§(param1:MouseEvent) : void
      {
         this.selected = !this.selected;
      }
      
      private function §_-b27§(param1:FriendEvent) : void
      {
         if(this.§_-EC§)
         {
            this.§_-EC§.text = param1.friend.name;
         }
         this.photo.load(param1.friend.photoUrl);
         dispatchEvent(new §_-h2m§(this,§_-h2m§.CHANGED));
      }
   }
}

