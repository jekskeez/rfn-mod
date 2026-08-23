package buttons
{
   import flash.text.TextFormat;
   import views.§_-y2c§;
   
   public class §_-p2d§ extends §_-F1F§
   {
      
      public var §_-k1g§:§_-y2c§;
      
      private var field:§_-22V§;
      
      public function §_-p2d§(param1:String)
      {
         super(new ButtonAwardBack());
         var _loc2_:§_-22V§ = new §_-22V§(param1,0,5,new TextFormat(§_-22V§.§_-pJ§,16,8746579));
         _loc2_.x = 100 - int(_loc2_.textWidth * 0.5);
         addChild(_loc2_);
         this.§_-k1g§ = new §_-y2c§([{
            "image":new AwardTypeBack(),
            "X":0,
            "Y":0
         },{
            "image":new AwardTypeActive(),
            "X":0,
            "Y":0
         },{
            "image":new AwardTypeActive(),
            "X":0,
            "Y":0
         }],170);
         this.§_-k1g§.§_-iD§(new AwardTypeBack());
         this.§_-k1g§.x = 15;
         this.§_-k1g§.y = 30;
         this.§_-k1g§.mouseEnabled = false;
         addChild(this.§_-k1g§);
         this.field = new §_-22V§("",0,28,new TextFormat(null,16,16777215,true));
         addChild(this.field);
      }
      
      public function §_-B1n§(param1:int, param2:int) : void
      {
         this.§_-k1g§.§_-B1n§(param1,param2);
         this.field.text = param1 + "/" + param2;
         this.field.x = 100 - int(this.field.textWidth * 0.5);
      }
      
      override protected function §_-m2l§() : void
      {
         super.§_-m2l§();
         if(this.§_-k1g§ != null)
         {
            this.§_-k1g§.§_-w10§(false);
         }
      }
      
      override protected function §_-Rf§() : void
      {
         super.§_-Rf§();
         if(this.§_-k1g§ != null)
         {
            this.§_-k1g§.§_-w10§(true);
         }
      }
   }
}

