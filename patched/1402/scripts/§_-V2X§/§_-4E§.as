package §_-V2X§
{
   import §_-Al§.§_-K1K§;
   import §_-B1G§.ScrollPane;
   import §_-E1v§.§_-31Y§;
   import §_-E1v§.§_-w1k§;
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import flash.events.MouseEvent;
   
   public class §_-4E§ extends Dialog
   {
      
      private static const §_-a28§:int = 320;
      
      private static var §_-i2l§:Vector.<§_-4E§> = new Vector.<§_-4E§>(0);
      
      private var type:int = -1;
      
      private var isClan:Boolean = false;
      
      private var entityId:int = 0;
      
      private var form:§_-K1K§ = null;
      
      private var §_-qm§:§_-K2G§ = null;
      
      private var §_-93y§:§_-K2G§ = null;
      
      private var §_-W18§:ScrollPane = null;
      
      public function §_-4E§()
      {
         super(gls("Поле"),true,true,null,true);
         this.init();
      }
      
      public static function §_-d2v§() : void
      {
         var _loc1_:* = int(§_-i2l§.length - 1);
         while(_loc1_ >= 0)
         {
            §_-i2l§[_loc1_].hide();
            _loc1_--;
         }
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         var _loc2_:int = §_-i2l§.indexOf(this);
         if(_loc2_ != -1)
         {
            §_-i2l§.splice(_loc2_,1);
         }
         super.hide(param1);
      }
      
      public function §_-lR§(param1:String, param2:int, param3:*, param4:Boolean = false, param5:int = 0) : void
      {
         this.caption = param1;
         this.type = param2;
         this.isClan = param4;
         this.entityId = param5;
         if(this.form != null)
         {
            this.form.removeEventListener("change",this.§_-o2h§);
         }
         if(this.isClan)
         {
            this.form = §_-w1k§.§_-Eq§(this.type);
         }
         else
         {
            this.form = §_-K1K§.§_-Eq§(this.type);
         }
         if(this.form != null)
         {
            this.form.addEventListener("change",this.§_-o2h§);
         }
         if(this.form != null)
         {
            this.form.load(param3);
         }
         var _loc6_:int = (this.form != null ? this.form.width : 0) + 20;
         var _loc7_:int = Math.min(this.form != null ? this.form.height : 0,§_-a28§) + 20;
         if(!this.§_-W18§)
         {
            this.§_-W18§ = new ScrollPane();
         }
         this.§_-W18§.source = this.form;
         this.§_-W18§.setSize(_loc6_,_loc7_);
         this.§_-W18§.x = 0;
         this.§_-W18§.y = 5;
         addChild(this.§_-W18§);
         place(this.§_-qm§,this.§_-93y§);
         this.§_-n1j§();
         show();
         if(§_-i2l§.indexOf(this) == -1)
         {
            §_-i2l§.push(this);
         }
      }
      
      private function init() : void
      {
         this.§_-qm§ = new §_-K2G§(gls("Сохранить"));
         this.§_-qm§.addEventListener(MouseEvent.CLICK,this.§_-HQ§);
         this.§_-93y§ = new §_-K2G§(gls("Отмена"));
         this.§_-93y§.§_-I29§();
         this.§_-93y§.addEventListener(MouseEvent.CLICK,this.hide);
      }
      
      private function §_-n1j§() : void
      {
         var _loc1_:Number = this.§_-W18§.y + this.§_-W18§.height;
         var _loc2_:Number = Math.max(this.§_-qm§.height,this.§_-93y§.height);
         this.height = this.topOffset + _loc1_ + this.§_-f2d§ + _loc2_;
      }
      
      private function §_-o2h§(... rest) : void
      {
         if(!this.§_-W18§ || !this.§_-W18§.source)
         {
            return;
         }
         this.§_-W18§.width = this.§_-W18§.source.width + 20;
         this.§_-W18§.height = Math.min(this.§_-W18§.source.height,§_-a28§) + 20;
         this.§_-W18§.update();
         this.§_-n1j§();
      }
      
      private function §_-HQ§(param1:MouseEvent) : void
      {
         if(this.form == null)
         {
            return;
         }
         if(this.isClan)
         {
            §_-31Y§.§_-n2O§(this.entityId,this.type,this.form.save());
         }
         else
         {
            §_-31Y§.§_-g28§(this.entityId,this.type,this.form.save());
         }
         this.hide(param1);
      }
   }
}

