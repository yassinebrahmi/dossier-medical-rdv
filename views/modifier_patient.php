<?php
include '..\Models\Patient.php';

$p = new \Medical\Patient();
if (isset($_GET['patient_id']))
    $patient = $p->find_patient($_GET['patient_id']);
else
    $patient = null;
?>
<div class="col-lg-9 mt-2">
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Nouveau Patient</h4>
            <h5 class="text-danger text-center"><?php if(isset($_GET['message'])) echo $_GET['message']; ?></h5>
        </div><!--end card-header-->
        <div class="card-body">
            <div class="general-label">
                <form method="post" action="../controller/action.php?query=update_patient">
                    <input name="patient_id" type="hidden" value="<?=$_GET['patient_id']?>">
                    <div class="form-group row">
                        <label for="nomprenom" class="col-sm-2 col-form-label font-weight-bold">Nom & Prénom</label>
                        <div class="col-sm-10">
                            <input type="text" name="nom_prenom" class="form-control" id="nomprenom" placeholder="Nom & Prénom" required value="<?= $patient['nom_prenom'] ?>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="sexe" class="col-sm-2 col-form-label font-weight-bold">Sexe</label>
                        <div class="col-sm-10">
                            <select id="sexe" class="form-control" name="sexe" required>
                                <option value="Homme" <?php if ($patient['sexe'] == "Homme") echo "selected"; else echo ''; ?> >
                                    Homme
                                </option>
                                <option value="Femme" <?php if ($patient['sexe'] == "Femme") echo "selected"; else echo ''; ?> >
                                    Femme
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="date_naissance" class="col-sm-2 col-form-label font-weight-bold">Date de naissance</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="date_naissance" name="date_naissance" value="<?= $patient['date_naissance'] ?>" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="email" class="col-sm-2 col-form-label font-weight-bold">Adresee mail</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email" placeholder="Adresse mail" required value="<?= $patient['email'] ?>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="tel" class="col-sm-2 col-form-label font-weight-bold">Tél</label>
                        <div class="col-sm-10">
                            <input type="tel" name="tel" class="form-control" id="tel" placeholder="Numéro de téléphone" value="<?= $patient['tel'] ?>">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-10 ml-auto">
                            <button type="submit" class="btn btn-primary">Valider</button>
                            <button type="reset" class="btn btn-danger">Anuuler</button>
                        </div>
                    </div>
                </form>
            </div>
        </div><!--end card-body-->
    </div><!--end card-->
</div>