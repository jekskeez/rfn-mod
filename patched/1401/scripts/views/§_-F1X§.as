package views
{
   import §_-I10§.§_-O1T§;
   import §_-I10§.§_-f2P§;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.DialogRepost;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import utils.§_-73l§;
   import utils.§_-w2v§;
   import utils.§_-x1Z§;
   
   public class §_-F1X§ extends Sprite
   {
      
      public static const §_-g1j§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,16,6697728,true);
      
      public static const TEXT:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,6697728,false);
      
      public static const §_-V2H§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,16,16777215,true);
      
      public var id:int;
      
      private var §_-M1T§:DisplayObject;
      
      private var §_-k1g§:§_-w2v§;
      
      private var field:§_-22V§;
      
      private var §_-Z2G§:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      private var §_-l2h§:DisplayObject;
      
      private var §_-Er§:DisplayObject;
      
      private var §_-M2e§:DisplayObject;
      
      private var §_-XW§:§_-Hb§;
      
      public function §_-F1X§(param1:int)
      {
         super();
         this.id = param1;
         this.init();
      }
      
      public function update() : void
      {
         var _loc2_:uint = 0;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc1_:uint = §_-f2P§.§_-C21§(this.id);
         if(§_-f2P§.§_-33f§(this.id) == null)
         {
            _loc2_ = uint(§_-O1T§.DATA[this.id]["total"]);
            _loc3_ = §_-f2P§.§_-Y2w§(this.id);
            _loc4_ = §_-f2P§.§_-D2S§(this.id);
            this.§_-k1g§.§_-B1n§(_loc1_,_loc2_);
            this.§_-k1g§.buttonMode = _loc3_;
            this.field.text = _loc1_ + "/" + _loc2_;
            this.field.x = 110 - this.field.textWidth * 0.5;
            this.§_-XW§.setStatus(_loc3_ ? gls("<body>Рассказать друзьям</body>") : gls("<body>Выполняется...</body>"));
            if(_loc4_)
            {
               this.§_-XW§.setStatus(gls("<body>Получи достижение <b>«{0}»</b></body>",§_-f2P§.§_-M1r§(this.id)));
            }
            this.§_-l2h§.visible = _loc4_;
            this.§_-Er§.visible = _loc3_;
            this.§_-M2e§.visible = !_loc3_ && !_loc4_;
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < this.§_-Z2G§.length)
            {
               this.§_-Z2G§[_loc5_].filters = (_loc1_ & 1 << _loc5_) == 0 ? §_-x1Z§.§_-c2G§ : [];
               _loc5_++;
            }
         }
         this.§_-M1T§.visible = !§_-f2P§.§_-Y2w§(this.id);
      }
      
      private function init() : void
      {
         var _loc5_:int = 0;
         var _loc6_:DisplayObject = null;
         var _loc1_:DisplayObject = §_-O1T§.§_-81e§(this.id);
         _loc1_.width = _loc1_.height = 100;
         _loc1_.addEventListener(MouseEvent.MOUSE_UP,this.§_-P2v§);
         addChild(_loc1_);
         this.§_-M1T§ = new ImageAwardMask();
         this.§_-M1T§.width = this.§_-M1T§.height = 100;
         addChild(this.§_-M1T§);
         new §_-Hb§(_loc1_,gls("Рассказать друзьям"));
         graphics.beginFill(16250092);
         graphics.lineStyle(2,16049098);
         graphics.drawRoundRect(107,0,280,100,3,3);
         var _loc2_:§_-22V§ = new §_-22V§(§_-O1T§.DATA[this.id]["name"],112,5,§_-g1j§);
         _loc2_.mouseEnabled = false;
         addChild(_loc2_);
         var _loc3_:§_-22V§ = new §_-22V§(§_-O1T§.DATA[this.id]["text"],112,30,TEXT);
         _loc3_.mouseEnabled = false;
         _loc3_.wordWrap = true;
         _loc3_.width = 265;
         addChild(_loc3_);
         var _loc4_:Array = §_-f2P§.§_-33f§(this.id);
         if(_loc4_ == null)
         {
            this.§_-k1g§ = new §_-w2v§([{
               "image":new AwardBack(),
               "X":0,
               "Y":0
            },{
               "image":new AwardActive(),
               "X":0,
               "Y":0.5
            },{
               "image":new AwardActive(),
               "X":0,
               "Y":0.5
            }],220);
            this.§_-k1g§.x = 115;
            this.§_-k1g§.y = 70;
            this.§_-k1g§.addEventListener(MouseEvent.MOUSE_UP,this.§_-P2v§);
            addChild(this.§_-k1g§);
            this.§_-Er§ = new ImageAwardBarStar();
            this.§_-Er§.x = 225;
            this.§_-Er§.scaleX = this.§_-Er§.scaleY = 1.25;
            this.§_-k1g§.addChild(this.§_-Er§);
            this.§_-M2e§ = new ImageBarProgress();
            this.§_-M2e§.x = 225;
            this.§_-M2e§.scaleX = this.§_-M2e§.scaleY = 1.25;
            this.§_-k1g§.addChild(this.§_-M2e§);
            this.§_-l2h§ = new ImageBarLock();
            this.§_-l2h§.x = 225;
            this.§_-l2h§.scaleX = this.§_-l2h§.scaleY = 1.25;
            this.§_-k1g§.addChild(this.§_-l2h§);
            this.§_-XW§ = new §_-Hb§(this.§_-k1g§,"",false,true);
            this.field = new §_-22V§("",0,-1,§_-V2H§);
            this.field.mouseEnabled = false;
            this.§_-k1g§.addChild(this.field);
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc6_ = §_-O1T§.§_-j2j§(this.id,_loc5_);
               _loc6_.x = 115 + 40 * _loc5_;
               _loc6_.y = 70;
               this.§_-Z2G§.push(_loc6_);
               addChild(this.§_-Z2G§[_loc5_]);
               new §_-Hb§(_loc6_,_loc4_[_loc5_]);
               _loc5_++;
            }
         }
         this.update();
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         if(!§_-f2P§.§_-Y2w§(this.id))
         {
            return;
         }
         new DialogRepost(§_-73l§.WALL_AWARD,this.id).show();
      }
   }
}

